case "$OCAML_VERSION,$OPAM_VERSION" in
4.00.1,1.1.0) ppa=avsm/ocaml40+opam11 ;;
4.00.1,1.2.0) ppa=avsm/ocaml40+opam12; pinx=add ;;
4.01.0,1.1.0) ppa=avsm/ocaml41+opam11 ;;
4.01.0,1.2.0) ppa=avsm/ocaml41+opam12; pinx=add ;;
4.02.1,1.1.0) ppa=avsm/ocaml42+opam11 ;;
4.02.1,1.2.0) ppa=avsm/ocaml42+opam12; pinx=add ;;
*) echo Unknown $OCAML_VERSION,$OPAM_VERSION; exit 1 ;;
esac

echo "yes" | sudo add-apt-repository ppa:$ppa
sudo apt-get update -qq
sudo apt-get install -qq ocaml ocaml-native-compilers camlp4-extra opam time libssl-dev

export OPAMYES=1
export OPAMVERBOSE=1
echo OCaml version
ocaml -version
echo OPAM versions
opam --version
opam --git-version

opam init
opam remote add mirage git://github.com/mirage/mirage-dev
opam pin $pinx cohttp git://github.com/mirage/ocaml-cohttp
opam pin $pinx github .
opam install github
opam install js_of_ocaml
