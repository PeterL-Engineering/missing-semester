import typer

def favNumber(number: str) -> None:
  print(f"{number} is an amazing number!")

def goodbye() -> None:
  print(f"Goodbye! It was nice meeting you!")

def greet(name: str) -> None:
  print(f"Hi {name}!")

def cli() -> None:
  app = typer.Typer()
  app.command()(greet)
  app.command()(favNumber)
  app.command()(goodbye)
  app()

if __name__ == "__main__":
  cli()