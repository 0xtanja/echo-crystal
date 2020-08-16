<h1 align="center">Echo</h1>

<div align="center">
    <i>Echo is a service that responds with any header or body you send over, as-is.</i>
</div>
<br>

## About

This project is intended to be educational, for-research-only and solving a fictional problem, and is not intended to work on any production environment whatsoever as it can potentially leak private information due to its most basic functionality.

## Requirements

* [Crystal Lang](https://crystal-lang.org/) >= `0.24.2` (2018-03-10)

## Up and running

### Configuration

| Configuration | Environmental variable | Purpose | Default |
|-|-|-|-|
| Echo host | `ECHO_HOST` | The host Echo will run on | `0.0.0.0` |
| Echo port | `ECHO_PORT` | The port Echo will listen to | `8018` |

### Running

A Makefile is provided to handle common operations – like running the service.

| Target | Description | Examples |
|-|-|-|
| `run` | Run the service | <pre>$ make run<br>Listening on 0.0.0.0:8018</pre> |
| `build` | Build the binary | <pre>$ make build<br>crystal build -p -t --verbose --error-trace -o echo src/echo.cr<br>cc "${@}" -o /home/...<br>...<br></pre>
| `clean` | Delete the binary | <pre>$ make clean</pre> |

Or rather using `crystal` binary:

1. Running:
```bash
$ crystal run src/echo.cr
Listening on 0.0.0.0:8018
```

2. Building a binary:
```bash
crystal build src/echo.cr
...
```
Refer to [Crystal's documentation](https://crystal-lang.org/docs/using_the_compiler/) for more information and help.

## Author

Tanja Álvarez 2018
