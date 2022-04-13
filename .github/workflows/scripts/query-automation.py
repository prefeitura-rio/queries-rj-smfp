import os
import sys

sys.path.append(".github/workflows/")

from scripts.metadata_automation import *


def get_basic_treated_query(spreadsheet_id: str, dataset_id: str, table_id: str):
    """
    generates a basic treated query
    """

    gspread_client = get_gspread_client()
    spreadsheet = download_spreadsheet(spreadsheet_id, gspread_client)

    columns = pd.read_excel(spreadsheet, sheet_name="colunas")

    ## se Nome da coluna 'e null a coluna nao deve entrar em producao'
    columns = columns[columns["Nome da coluna"].notnull()]
    tabela = pd.read_excel(spreadsheet, sheet_name="tabela", header=None)
    table_columns = tabela[0].tolist()
    tabela = tabela.T.tail(1)
    tabela.columns = table_columns

    project_id = tabela["bigquery_project"].values[0]
    # dataset_id = tabela["dataset_id"].values[0]
    # table_id = tabela["table_id"].values[0]

    originais = columns["Nome original da coluna"].tolist()
    nomes = columns["Nome da coluna"].tolist()
    tipos = columns["Tipo da coluna"].tolist()

    indent_space = 4 * " "
    query = "SELECT \n"
    for original, nome, tipo in zip(originais, nomes, tipos):
        if tipo == "GEOGRAPHY":
            query += f"ST_GEOGFROMTEXT({original}) AS {nome},\n"
        elif "id" in nome or tipo == "INT64":
            query += (
                indent_space
                + f"SAFE_CAST(REGEXP_REPLACE({original}, r'\.0$', '') AS {tipo}) AS {nome},\n"
            )
        elif tipo == "DATETIME":
            query += (
                indent_space
                + f"SAFE_CAST(SAFE.PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S', {original}) AS {tipo}) AS {nome},\n"
            )
        elif tipo == "FLOAT64":
            query += indent_space + (
                f"SAFE_CAST(REGEXP_REPLACE({original}, r',', '.') AS {tipo}) AS {nome},"
            )
        else:
            query += indent_space + f"SAFE_CAST({original} AS {tipo}) AS {nome},\n"

    query += f"FROM {project_id}.{dataset_id}_staging.{table_id} AS t"

    return query


def dump_query_into_model_sql(
    query: str, dataset_id: str, table_id: str, model_sql_path: str = None
):
    # path to save the model
    model_sql_path = (
        Path(f"models/{dataset_id}/{table_id}.sql")
        if model_sql_path is None
        else Path(model_sql_path)
    )
    if query != "":
        model_sql_path.parent.mkdir(parents=True, exist_ok=True)
        # save publish.sql in table_folder
        model_sql_path.open("w", encoding="utf-8").write(query)
    else:
        print("No query to save")


if __name__ == "__main__":
    # Load the metadata file
    metadata: dict = load_metadata_file(METADATA_FILE_PATH)

    # List all models
    models: dict = metadata["models"]

    # Iterate over datasets
    for dataset_id, dataset in models.items():

        print(f"Ingesting metadata for dataset {dataset_id}")

        # Iterate over tables
        for table_id in dataset:

            # Get the table
            table: dict = dataset[table_id]

            # Check whether there is a spreadsheet ID set for this table
            if "spreadsheet_id" in table and table["spreadsheet_id"]:
                print(
                    f"- Creating basic treated querie for table {table_id}...", end="\n"
                )

                # Fetch a basic query from Google Sheets metadata
                query = get_basic_treated_query(
                    table["spreadsheet_id"], dataset_id, table_id
                )
                dump_query_into_model_sql(query, dataset_id, table_id)
