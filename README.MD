# Optysys

Optical Inspection System Platform. Using Python 3.11 and PySide6 (Qt).

# Features

* Compatible with Python **3.10+**.
* Internationalization including (including text direction).
* Resources compiled ahead of time:
    * Everything in `data`, `i18n`, and `qml` is compiled into Python files.
    * Final build only consists of Python files.
* Testing preconfigured (Python + Qml).
* CI preconfigured.
* Client side window decorations implemented.
* Qt creator not required (we suggest VSCode).

## Setup

### Windows Setup 

#### Requirements

- Install [python v3.10+](https://www.python.org/downloads/).
- Install [git-bash](https://git-scm.com/downloads).
- Install [chocolatey](https://chocolatey.org/install).
- Open powershell as admin and run: `choco install make`.

#### Project Setup

- Clone this repository.
- Open git-bash in the directory.
- Set up and activate virtual environment:
  - `python -m venv venv`
  - `source venv/Scripts/activate`
- Install requirements `python -m pip install -r requirements.txt`
- Open ".vscode/launch.json" and ensure the python path is set for Windows.

**The make build system is supposed to be used from git-bash**

### Linux/MacOS Setup

#### Requirements

- Make sure `python` is on version **3.10** or later.
- Install `make`.

#### Project Setup

- Clone this repository.
- Set up and activate virtual environment:
  - `python -m venv venv`
  - `source venv/bin/activate`
- Install requirements `python -m pip install -r requirements.txt`.
- Open ".vscode/launch.json" and ensure the python path is set for Linux/MacOS.

## Compiling and starting the app

- Set up the development environment for your OS (previous steps).
- Run `make develop-build` to compile resources.
- Run `python main.py` to start the app.

Run make develop-build after each change in the data, i18n, or qml directories. 
This will compile everything into a Python file and move it into the myapp directory where it will be picked up on app start.

## Adding a New Language

- Checkout repository.
- Make sure development environment is set up correctly for your os.
- Create a new translation file by running:
  ```shell
  make create-new-translation lang=<locale>
  ```
  while `<locale>` is the locale for the language to add.
- Update all possible translations by running:
  ```shell
  make update-translations
  ```
- New `<locale>.ts` file appears in the `i18n` directory.
- Translate the `ts` file using Qt Linguist 6.
- To test the translation:
  - Add a new entry in the `MyAppLanguageModel.qml` file
  - Run
    ```shell
    make develop-build
    ```

## Makefile targets

For a complete overview please check out the Makefile. 
The most important `make` options are:

- `clean`: Cleans up all generated files.
- `check-pyside-setup`: Checks if PySide is correctly set up.
- `check-qml-setup`: Checks if Qml (for tests only) is correctly set up.
- `build`: Builds the project into build/release/myapp.
- `build-clean`: Cleans up the build directory.
- `test`: Runs all tests.
- `test-python`: Runs all Python tests.
- `test-qml`: Runs all Qml tests.
- `test-clean`: Cleans up the compiled resources in the test directory.
- `develop-build`: Generates resources and copies them into the source directory.
- `develop-clean`: Cleans up the compiled resources in the source directory.
- `update-translations`: Traverses qml & py files to update translation files.
- `create-new-translation`: Allows to add translations to the project.
  Usage: `make create-new-translation lang=<locale>` (e.g., `make create-new-translation lang=es`).

## Further Reading

Qt, QtQuick & Python examples are located in `venv/lib/<python-version>/site-packages/PySide6/examples` 
after the dev environment is set up completely.

* [PySide6](https://doc.qt.io/qtforpython/contents.html)
* [QML Coding Conventions](https://doc.qt.io/qt-6/qml-codingconventions.html)
* [Python & Qml](https://doc.qt.io/qtforpython/PySide6/QtQml/index.html)
* [Scripting](https://doc.qt.io/qt-6/topics-scripting.html)
* [Importing JavaScript Resources in QML](https://doc.qt.io/qt-6/qtqml-javascript-imports.html)
