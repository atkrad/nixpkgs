{ lib
, aiohttp
, buildPythonPackage
, fetchFromGitHub
, pythonOlder
, setuptools
, wheel
}:

buildPythonPackage rec {
  pname = "aioairzone-cloud";
  version = "0.2.7";
  format = "pyproject";

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "Noltari";
    repo = "aioairzone-cloud";
    rev = "refs/tags/${version}";
    hash = "sha256-v6cK4j16BhTqjdc5J9XQWGFCa1r9f0/dto9teVTNn0c=";
  };

  nativeBuildInputs = [
    setuptools
    wheel
  ];

  propagatedBuildInputs = [
    aiohttp
  ];

  pythonImportsCheck = [
    "aioairzone_cloud"
  ];

  # Module has no tests
  doCheck = false;

  meta = with lib; {
    description = "Library to control Airzone via Cloud API";
    homepage = "https://github.com/Noltari/aioairzone-cloud";
    changelog = "https://github.com/Noltari/aioairzone-cloud/releases/tag/${version}";
    license = licenses.asl20;
    maintainers = with maintainers; [ fab ];
  };
}
