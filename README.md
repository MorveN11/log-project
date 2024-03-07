# Log Message Format -  Manuel Morales

> [!NOTE]
> This project contains all the work I have done for the Log Message Format project in the Functional Programming in Programming V course. The project is part of the Functional Programming in Haskell.

## Introduction
This project discusses the format of log messages, which consist of different types of log entries. Each log message starts with a character indicating its type, followed by additional information.

## Log Message Format
The log message format includes:
- **I:** Informational messages
- **W:** Warning messages
- **E:** Error messages, including an integer indicating the severity level ranging from 1 to 100. Informational and warning messages do not include severity levels.

## Example Log Messages
A snippet of a log file containing an informational message followed by a level 2 error message is provided.

## Data Types
- `MessageType`: Represents the type of log messages.
- `TimeStamp`: Represents the timestamp of log messages.
- `LogMessage`: Represents individual log messages or unknown messages.

## Exercise 1
Defines functions to parse individual log messages from a log file.

## Ordering the Logs
Defines a data type `MessageTree` to store and order log messages.

## Exercise 2
Defines the `insert` function to insert a new log message into a sorted message tree.

## Exercise 3
Defines the `build` function to build a message tree from a list of log messages.

## Exercise 4
Defines the `inOrder` function to retrieve all log messages from a sorted message tree in order.

## Exercise 5
Defines the `whatWentWrong` function to extract relevant error messages with a severity of at least 50 from a list of log messages.

## Testing
You can test the `whatWentWrong` function with `testWhatWentWrong`, which is provided by the Log module. Provide `testWhatWentWrong` with your `parse` function, `whatWentWrong` function, and the name of the log file to parse.


## Versions

- **Cabal**:  3.0
- **Stack**:  LTS 22.7
- **GHC**:    9.6.4 

## Instructions

> [!NOTE]
> You need to have installed the GHCUP tool to run this project.

> [!IMPORTANT]
>You need to build the project to run the code and the tests.

To build this project you need to run the following command:

```bash
stack clean && stack build
```

To execute the Main of the project, you need to run the following command:

```bash
stack run
```

To run the tests of this project, you need to run the following command:

```bash
stack test
```
