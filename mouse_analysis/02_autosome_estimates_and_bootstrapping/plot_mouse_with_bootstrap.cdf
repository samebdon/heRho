(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 12.1' *)

(***************************************************************************)
(*                                                                         *)
(*                                                                         *)
(*  Under the Wolfram FreeCDF terms of use, this file and its content are  *)
(*  bound by the Creative Commons BY-SA Attribution-ShareAlike license.    *)
(*                                                                         *)
(*        For additional information concerning CDF licensing, see:        *)
(*                                                                         *)
(*         www.wolfram.com/cdf/adopting-cdf/licensing-options.html         *)
(*                                                                         *)
(*                                                                         *)
(***************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[      1088,         20]
NotebookDataLength[    532554,      11336]
NotebookOptionsPosition[    530107,      11286]
NotebookOutlinePosition[    530590,      11304]
CellTagsIndexPosition[    530547,      11301]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell["\<\
The longest-running sim to estimate across the first 50 iterations took:
\t82.5 hours for single-individual estimates
\t67.0 hours for pooled-individual estimates (faster, because more data makes \
the likelihood surface easier to explore?)
\
\>", "Text",
 CellChangeTimes->{{3.8368818884297*^9, 
  3.8368819628179197`*^9}},ExpressionUUID->"61df8be3-3278-4b41-9dc0-\
f11f0e0d181c"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"dataSingle", " ", "=", " ", 
   RowBox[{"Import", "[", 
    RowBox[{
    "\"\<single_ind_estimates_per_rep_d_1000.tsv\>\"", ",", "\"\<Dataset\>\"",
      ",", 
     RowBox[{"HeaderLines", "\[Rule]", " ", "0"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"dataPooled", " ", "=", " ", 
   RowBox[{"Import", "[", 
    RowBox[{
    "\"\<pooled_ind_estimates_per_rep_d_1000.tsv\>\"", ",", "\"\<Dataset\>\"",
      ",", 
     RowBox[{"HeaderLines", "\[Rule]", " ", "0"}]}], "]"}]}], ";"}]}], "Input",\

 CellChangeTimes->{{3.836449360643943*^9, 3.836449446946363*^9}, {
  3.836881968499881*^9, 3.836882017402774*^9}, {3.836882175679481*^9, 
  3.836882188805059*^9}, {3.843710730270733*^9, 3.8437107463646193`*^9}, {
  3.844500283933223*^9, 
  3.844500288373631*^9}},ExpressionUUID->"1571a6c2-35da-4fa6-b2ce-\
7ec084e38355"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"kappasSingle", " ", "=", " ", 
   RowBox[{
    RowBox[{
     RowBox[{"#", "[", 
      RowBox[{"[", 
       RowBox[{"1", ";;", "19"}], "]"}], "]"}], "&"}], "/@", "dataSingle"}]}],
   ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"gammasSingle", " ", "=", " ", 
   RowBox[{
    RowBox[{
     RowBox[{"#", "[", 
      RowBox[{"[", 
       RowBox[{"20", ";;", 
        RowBox[{"20", "+", "19", "-", "1"}]}], "]"}], "]"}], " ", "&"}], "/@",
     " ", "dataSingle"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"LsSingle", " ", "=", " ", 
    RowBox[{
     RowBox[{
      RowBox[{"#", "[", 
       RowBox[{"[", 
        RowBox[{"-", "1"}], "]"}], "]"}], "&"}], "/@", "dataSingle"}]}], 
   ";"}], "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"kappasPooled", " ", "=", " ", 
   RowBox[{
    RowBox[{
     RowBox[{"#", "[", 
      RowBox[{"[", 
       RowBox[{"1", ";;", "19"}], "]"}], "]"}], "&"}], "/@", "dataPooled"}]}],
   ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"gammasPooled", " ", "=", " ", 
   RowBox[{
    RowBox[{
     RowBox[{"#", "[", 
      RowBox[{"[", 
       RowBox[{"20", ";;", 
        RowBox[{"20", "+", "19", "-", "1"}]}], "]"}], "]"}], " ", "&"}], "/@",
     " ", "dataPooled"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"LsPooled", " ", "=", " ", 
   RowBox[{
    RowBox[{
     RowBox[{"#", "[", 
      RowBox[{"[", 
       RowBox[{"-", "1"}], "]"}], "]"}], "&"}], "/@", "dataPooled"}]}], 
  ";"}]}], "Input",
 CellChangeTimes->{{3.8364494697810926`*^9, 3.8364496881101627`*^9}, {
  3.836449721929489*^9, 3.836449787770483*^9}, {3.836882031235396*^9, 
  3.836882033089772*^9}, {3.836882113004553*^9, 3.836882116768763*^9}, {
  3.836882205960251*^9, 3.836882215465047*^9}, {3.836882288718343*^9, 
  3.836882315190229*^9}},
 CellLabel->"In[3]:=",ExpressionUUID->"3268ba5f-1135-40f2-8d55-6849191e34d5"],

Cell[BoxData[
 RowBox[{
  RowBox[{"truthChrKappaGamma", " ", "=", " ", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"1", ",", "0.00145756486", ",", "0.00235996959"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"2", ",", "0.00180727905", ",", "0.00342621318"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"3", ",", "0.00186536342", ",", "0.0035423356"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"4", ",", "0.00161298296", ",", "0.00225109243"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"5", ",", "0.00194717866", ",", "0.0031020052"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"6", ",", "0.00170580009", ",", "0.00271860563"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"7", ",", "0.00167423386", ",", "0.00262167771"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"8", ",", "0.0023152398", ",", "0.0037924023"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"9", ",", "0.00173683272", ",", "0.0035986003"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"10", ",", "0.00196466475", ",", "0.00395571965"}], "}"}], ",", 
     
     RowBox[{"{", 
      RowBox[{"11", ",", "0.00174678502", ",", "0.00279145592"}], "}"}], ",", 
     
     RowBox[{"{", 
      RowBox[{"12", ",", "0.00175203665", ",", "0.00358232934"}], "}"}], ",", 
     
     RowBox[{"{", 
      RowBox[{"13", ",", "0.00189861553", ",", "0.00443149452"}], "}"}], ",", 
     
     RowBox[{"{", 
      RowBox[{"14", ",", "0.00192549761", ",", "0.0039928514"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"15", ",", "0.00160604398", ",", "0.00211168309"}], "}"}], ",", 
     
     RowBox[{"{", 
      RowBox[{"16", ",", "0.00185130817", ",", "0.00380296933"}], "}"}], ",", 
     
     RowBox[{"{", 
      RowBox[{"17", ",", "0.00180849818", ",", "0.00292979399"}], "}"}], ",", 
     
     RowBox[{"{", 
      RowBox[{"18", ",", "0.0021214869", ",", "0.00257933143"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"19", ",", "0.00268619142", ",", "0.00460506687"}], "}"}]}], 
    "}"}]}], ";"}]], "Input",
 CellChangeTimes->{{3.843711186774105*^9, 3.843711215033895*^9}},
 CellLabel->"In[9]:=",ExpressionUUID->"5f4fa35d-685e-474e-96f8-68e4cadc89e3"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"truthKappas", " ", "=", "  ", 
   RowBox[{
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"#", "[", 
        RowBox[{"[", "1", "]"}], "]"}], ",", 
       RowBox[{"#", "[", 
        RowBox[{"[", "2", "]"}], "]"}]}], "}"}], "&"}], "/@", 
    "truthChrKappaGamma"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"truthGammas", " ", "=", " ", 
   RowBox[{
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"#", "[", 
        RowBox[{"[", "1", "]"}], "]"}], ",", 
       RowBox[{"#", "[", 
        RowBox[{"[", "3", "]"}], "]"}]}], "}"}], "&"}], "/@", 
    "truthChrKappaGamma"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"truthLs", " ", "=", " ", 
   RowBox[{"{", 
    RowBox[{"{", 
     RowBox[{"1", ",", "108.399686"}], "}"}], "}"}]}], ";"}]}], "Input",
 CellChangeTimes->{{3.836450168691977*^9, 3.836450208823572*^9}, {
  3.8364502809311438`*^9, 3.836450295740097*^9}, {3.836450334915553*^9, 
  3.8364505836597843`*^9}, {3.836450649199451*^9, 3.836450658400449*^9}, {
  3.836882701948826*^9, 3.836882878373479*^9}, {3.8437109052402143`*^9, 
  3.843711019903903*^9}, {3.8437112213093033`*^9, 3.8437112842768707`*^9}, {
  3.8437124075783863`*^9, 3.843712408306082*^9}},
 CellLabel->"In[10]:=",ExpressionUUID->"6de67771-f20f-41b4-96ea-cb6ea0128980"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"chrStrings", " ", "=", " ", 
  RowBox[{
   RowBox[{
    RowBox[{
     RowBox[{"TextString", "[", "#", "]"}], "&"}], "/@", 
    RowBox[{"Range", "[", "19", "]"}]}], "//", "InputForm"}]}]], "Input",
 CellChangeTimes->{{3.8438800880802813`*^9, 3.8438801160439653`*^9}, {
  3.844247636501422*^9, 3.844247639909626*^9}},
 CellLabel->"In[27]:=",ExpressionUUID->"b7a83ba5-70ce-41ba-839d-13b45edabb82"],

Cell["\<\
{\"1\", \"2\", \"3\", \"4\", \"5\", \"6\", \"7\", \"8\", \"9\", \"10\", \
\"11\", \"12\", \"13\", \"14\", \"15\", \"16\", \"17\", \"18\", \"19\"}\
\>", "Output",
 CellChangeTimes->{{3.843880093269788*^9, 3.843880116280562*^9}, 
   3.843883284770844*^9, 3.8442435724134827`*^9, 3.844247640292817*^9},
 CellLabel->
  "Out[27]//InputForm=",ExpressionUUID->"45ee32a5-65fe-4f7b-a344-\
fc2aaeef64da"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"chrStrings", " ", "=", " ", 
  RowBox[{"{", 
   RowBox[{
   "\"\<1\>\"", ",", " ", "\"\<2\>\"", ",", " ", "\"\<3\>\"", ",", " ", 
    "\"\<4\>\"", ",", " ", "\"\<5\>\"", ",", " ", "\"\<6\>\"", ",", " ", 
    "\"\<7\>\"", ",", " ", "\"\<8\>\"", ",", " ", "\"\<9\>\"", ",", " ", 
    "\"\<10\>\"", ",", " ", "\"\<11\>\"", ",", " ", "\"\<12\>\"", ",", " ", 
    "\"\<13\>\"", ",", " ", "\"\<14\>\"", ",", " ", "\"\<15\>\"", ",", " ", 
    "\"\<16\>\"", ",", " ", "\"\<17\>\"", ",", " ", "\"\<18\>\"", ",", " ", 
    "\"\<19\>\""}], "}"}]}]], "Input",
 CellChangeTimes->{{3.844247664236923*^9, 3.844247668545878*^9}},
 CellLabel->"In[29]:=",ExpressionUUID->"151990f5-b606-4daa-b310-7d51d27409ab"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"\<\"1\"\>", ",", "\<\"2\"\>", ",", "\<\"3\"\>", ",", "\<\"4\"\>", 
   ",", "\<\"5\"\>", ",", "\<\"6\"\>", ",", "\<\"7\"\>", ",", "\<\"8\"\>", 
   ",", "\<\"9\"\>", ",", "\<\"10\"\>", ",", "\<\"11\"\>", ",", "\<\"12\"\>", 
   ",", "\<\"13\"\>", ",", "\<\"14\"\>", ",", "\<\"15\"\>", ",", "\<\"16\"\>",
    ",", "\<\"17\"\>", ",", "\<\"18\"\>", ",", "\<\"19\"\>"}], 
  "}"}]], "Output",
 CellChangeTimes->{3.844247668919675*^9},
 CellLabel->"Out[29]=",ExpressionUUID->"ef2da212-3415-404c-aaee-5599eedaebda"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData["truthKappas"], "Input",
 CellChangeTimes->{{3.8442486055103493`*^9, 3.844248607030027*^9}},
 CellLabel->"In[55]:=",ExpressionUUID->"4d7270dc-163e-407e-bd8b-f8e603090f67"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"1", ",", "0.00145756486`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "0.00180727905`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "0.00186536342`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "0.00161298296`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "0.00194717866`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"6", ",", "0.00170580009`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"7", ",", "0.00167423386`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"8", ",", "0.0023152398`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"9", ",", "0.00173683272`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"10", ",", "0.00196466475`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"11", ",", "0.00174678502`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"12", ",", "0.00175203665`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"13", ",", "0.00189861553`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"14", ",", "0.00192549761`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"15", ",", "0.00160604398`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"16", ",", "0.00185130817`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"17", ",", "0.00180849818`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"18", ",", "0.0021214869`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"19", ",", "0.00268619142`"}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.844248607357236*^9},
 CellLabel->"Out[55]=",ExpressionUUID->"1492a4df-5bd4-490b-bbcf-9ab58b0465a4"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"19", "*", "2"}]], "Input",
 CellChangeTimes->{{3.844248950549584*^9, 3.844248951158305*^9}},
 CellLabel->"In[66]:=",ExpressionUUID->"6983ef5d-1847-4b7e-9e2e-3dce184dc32b"],

Cell[BoxData["38"], "Output",
 CellChangeTimes->{3.84424895143051*^9},
 CellLabel->"Out[66]=",ExpressionUUID->"6852698e-5da3-42d3-b949-a9f50e2dc1a0"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"plotKappas", " ", "=", " ", 
  RowBox[{"MapThread", "[", 
   RowBox[{
    RowBox[{
     RowBox[{"{", 
      RowBox[{"#1", ",", 
       RowBox[{"#2", "[", 
        RowBox[{"[", "2", "]"}], "]"}]}], "}"}], "&"}], ",", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"Range", "[", 
       RowBox[{"2", ",", 
        RowBox[{"19", "*", "2"}], ",", "2"}], "]"}], ",", "truthKappas"}], 
     "}"}]}], "]"}]}], "\[IndentingNewLine]", 
 RowBox[{"plotGammas", " ", "=", " ", 
  RowBox[{"MapThread", "[", 
   RowBox[{
    RowBox[{
     RowBox[{"{", 
      RowBox[{"#1", ",", 
       RowBox[{"#2", "[", 
        RowBox[{"[", "2", "]"}], "]"}]}], "}"}], "&"}], ",", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"Range", "[", 
       RowBox[{"1", ",", 
        RowBox[{"19", "*", "2"}], ",", "2"}], "]"}], ",", "truthGammas"}], 
     "}"}]}], "]"}]}]}], "Input",
 CellChangeTimes->{{3.844248925169807*^9, 3.844249044765505*^9}, {
  3.844249098647318*^9, 3.844249099750907*^9}, {3.844249480064344*^9, 
  3.844249550579921*^9}, {3.84424961872779*^9, 3.8442496197991734`*^9}, {
  3.8442498237296352`*^9, 3.844249828305914*^9}, {3.844250026546925*^9, 
  3.844250032004052*^9}, {3.844250159265081*^9, 3.844250290982621*^9}},
 CellLabel->
  "In[156]:=",ExpressionUUID->"e19d595b-2652-41ae-954b-f23d68748c60"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"2", ",", "0.00145756486`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "0.00180727905`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"6", ",", "0.00186536342`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"8", ",", "0.00161298296`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"10", ",", "0.00194717866`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"12", ",", "0.00170580009`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"14", ",", "0.00167423386`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"16", ",", "0.0023152398`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"18", ",", "0.00173683272`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"20", ",", "0.00196466475`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"22", ",", "0.00174678502`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"24", ",", "0.00175203665`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"26", ",", "0.00189861553`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"28", ",", "0.00192549761`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"30", ",", "0.00160604398`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"32", ",", "0.00185130817`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"34", ",", "0.00180849818`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"36", ",", "0.0021214869`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"38", ",", "0.00268619142`"}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{
  3.844248990648807*^9, {3.8442490209792356`*^9, 3.8442490450943193`*^9}, 
   3.844249100247654*^9, {3.844249489932013*^9, 3.844249550959141*^9}, 
   3.84424962006219*^9, 3.844249828608761*^9, 3.844250032363078*^9, 
   3.8442501621038437`*^9, {3.8442501949670763`*^9, 3.8442502197846947`*^9}, {
   3.844250253297327*^9, 3.844250292053546*^9}},
 CellLabel->
  "Out[156]=",ExpressionUUID->"7146fa8d-a8b1-4329-b24b-a1d93b32dfba"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"1", ",", "0.00235996959`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "0.00342621318`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "0.0035423356`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"7", ",", "0.00225109243`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"9", ",", "0.0031020052`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"11", ",", "0.00271860563`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"13", ",", "0.00262167771`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"15", ",", "0.0037924023`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"17", ",", "0.0035986003`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"19", ",", "0.00395571965`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"21", ",", "0.00279145592`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"23", ",", "0.00358232934`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"25", ",", "0.00443149452`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"27", ",", "0.0039928514`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"29", ",", "0.00211168309`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"31", ",", "0.00380296933`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"33", ",", "0.00292979399`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"35", ",", "0.00257933143`"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"37", ",", "0.00460506687`"}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{
  3.844248990648807*^9, {3.8442490209792356`*^9, 3.8442490450943193`*^9}, 
   3.844249100247654*^9, {3.844249489932013*^9, 3.844249550959141*^9}, 
   3.84424962006219*^9, 3.844249828608761*^9, 3.844250032363078*^9, 
   3.8442501621038437`*^9, {3.8442501949670763`*^9, 3.8442502197846947`*^9}, {
   3.844250253297327*^9, 3.844250292055026*^9}},
 CellLabel->
  "Out[157]=",ExpressionUUID->"0bd4dfe2-3fb6-46fb-b575-71b415de548f"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"empty", " ", "=", " ", 
  RowBox[{"Table", "[", 
   RowBox[{
    RowBox[{"{", "0", "}"}], ",", 
    RowBox[{"{", 
     RowBox[{"i", ",", "1", ",", 
      RowBox[{"Length", "[", 
       RowBox[{"Transpose", "[", "gammasPooled", "]"}], "]"}]}], "}"}]}], 
   "]"}]}]], "Input",
 CellChangeTimes->{{3.8442493013317966`*^9, 3.84424932739041*^9}, 
   3.844249606885462*^9},
 CellLabel->
  "In[158]:=",ExpressionUUID->"0fa748c7-91ac-436b-badf-9198da4be296"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", "0", "}"}], ",", 
   RowBox[{"{", "0", "}"}], ",", 
   RowBox[{"{", "0", "}"}], ",", 
   RowBox[{"{", "0", "}"}], ",", 
   RowBox[{"{", "0", "}"}], ",", 
   RowBox[{"{", "0", "}"}], ",", 
   RowBox[{"{", "0", "}"}], ",", 
   RowBox[{"{", "0", "}"}], ",", 
   RowBox[{"{", "0", "}"}], ",", 
   RowBox[{"{", "0", "}"}], ",", 
   RowBox[{"{", "0", "}"}], ",", 
   RowBox[{"{", "0", "}"}], ",", 
   RowBox[{"{", "0", "}"}], ",", 
   RowBox[{"{", "0", "}"}], ",", 
   RowBox[{"{", "0", "}"}], ",", 
   RowBox[{"{", "0", "}"}], ",", 
   RowBox[{"{", "0", "}"}], ",", 
   RowBox[{"{", "0", "}"}], ",", 
   RowBox[{"{", "0", "}"}]}], "}"}]], "Output",
 CellChangeTimes->{
  3.8442493287963877`*^9, 3.844249491551639*^9, {3.844249607476083*^9, 
   3.84424962102798*^9}, 3.844250033221827*^9, {3.844250214313264*^9, 
   3.8442502210061502`*^9}, 3.8442502931727467`*^9},
 CellLabel->
  "Out[158]=",ExpressionUUID->"058051c9-7e39-45c8-a8c0-1c8078077cb8"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"pooledGCandCOplot", " ", "=", " ", 
  RowBox[{"Show", "[", "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"BoxWhiskerChart", "[", "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"MapThread", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"{", 
          RowBox[{"#1", ",", "#2"}], "}"}], "&"}], ",", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"Normal", "@", 
           RowBox[{"Transpose", "[", "gammasPooled", "]"}]}], ",", 
          RowBox[{"Normal", "@", 
           RowBox[{"Transpose", "[", "kappasPooled", "]"}]}]}], "}"}]}], 
       "]"}], ",", "\[IndentingNewLine]", 
      RowBox[{"PlotRange", "\[Rule]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"2", ",", 
           RowBox[{
            RowBox[{"19", "*", "2"}], "-", "1"}]}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"0", ",", "All"}], "}"}]}], "}"}]}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"Ticks", "\[Rule]", "None"}], ",", "\[IndentingNewLine]", 
      RowBox[{"ChartLabels", "\[Rule]", 
       RowBox[{"{", 
        RowBox[{"chrStrings", ",", 
         RowBox[{"{", "None", "}"}]}], "}"}]}], 
      RowBox[{"(*", 
       RowBox[{"ChartLabels", "\[Rule]", 
        RowBox[{"{", 
         RowBox[{"chrStrings", ",", 
          RowBox[{"{", 
           RowBox[{"None", ",", "None", ",", "None", ",", "None"}], "}"}]}], 
         "}"}]}], "*)"}], ",", "\[IndentingNewLine]", 
      RowBox[{"BarSpacing", "\[Rule]", 
       RowBox[{"{", 
        RowBox[{"0", ",", "0"}], "}"}]}], ",", "\[IndentingNewLine]", 
      RowBox[{"AspectRatio", "\[Rule]", 
       RowBox[{
        RowBox[{"9", "/", "16"}], "/", 
        RowBox[{"(", "1.5", ")"}]}]}], ",", "\[IndentingNewLine]", 
      RowBox[{"ChartLegends", "\[Rule]", 
       RowBox[{"{", 
        RowBox[{"\"\<GC rate\>\"", ",", "\"\<CO rate\>\""}], "}"}]}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"LabelStyle", "\[Rule]", 
       RowBox[{"Directive", "[", 
        RowBox[{"12", ",", "Bold", ",", "Thick"}], "]"}]}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"Frame", "\[Rule]", "True"}], ",", 
      RowBox[{"FrameStyle", "\[Rule]", 
       RowBox[{"Directive", "[", 
        RowBox[{"12", ",", "Bold", ",", "Thick", ",", 
         RowBox[{"Darker", "@", "Gray"}]}], "]"}]}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"ImageSize", "\[Rule]", "Large"}]}], "]"}], ",", 
    "\[IndentingNewLine]", 
    RowBox[{"ListPlot", "[", 
     RowBox[{"plotKappas", ",", 
      RowBox[{"PlotMarkers", "\[Rule]", 
       RowBox[{"{", 
        RowBox[{"Automatic", ",", "Small"}], "}"}]}], ",", 
      RowBox[{"PlotStyle", "\[Rule]", "Black"}]}], "]"}], ",", 
    "\[IndentingNewLine]", 
    RowBox[{"ListPlot", "[", 
     RowBox[{"plotGammas", ",", 
      RowBox[{"PlotMarkers", "\[Rule]", 
       RowBox[{"{", 
        RowBox[{"Automatic", ",", "Small"}], "}"}]}], ",", 
      RowBox[{"PlotStyle", "\[Rule]", "Black"}]}], "]"}], ",", 
    "\[IndentingNewLine]", 
    RowBox[{"ImageSize", "\[Rule]", "1000"}], ",", 
    RowBox[{"GridLines", "\[Rule]", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"Range", "[", 
        RowBox[{"0.5", ",", 
         RowBox[{
          RowBox[{"19", "*", "2"}], "+", "0.5"}], ",", "2"}], "]"}], ",", 
       RowBox[{"{", "0", "}"}]}], "}"}]}], ",", 
    RowBox[{"GridLinesStyle", "\[Rule]", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"Directive", "[", 
        RowBox[{"Thick", ",", 
         RowBox[{"Lighter", "@", 
          RowBox[{"Lighter", "@", "Gray"}]}]}], "]"}], ",", 
       RowBox[{"{", "White", "}"}]}], "}"}]}]}], "\[IndentingNewLine]", 
   "]"}]}]], "Input",
 CellChangeTimes->{{3.844243616741766*^9, 3.8442436494674063`*^9}, {
   3.844243783218156*^9, 3.844243790058847*^9}, 3.844243830017737*^9, {
   3.844243910302265*^9, 3.844243940499236*^9}, {3.844244029307844*^9, 
   3.844244029642784*^9}, {3.844244232029031*^9, 3.84424423585327*^9}, {
   3.8442443310334682`*^9, 3.8442443500754147`*^9}, {3.844244453169506*^9, 
   3.844244529595695*^9}, {3.844244580786574*^9, 3.844244602229618*^9}, {
   3.844244633346999*^9, 3.844244636898587*^9}, {3.844247100379238*^9, 
   3.844247155737236*^9}, {3.844247417853837*^9, 3.844247424622587*^9}, {
   3.844247508627604*^9, 3.844247646263489*^9}, {3.8442476809405193`*^9, 
   3.844247785451784*^9}, {3.8442478254337063`*^9, 3.8442478418378067`*^9}, {
   3.844247926937436*^9, 3.8442479413233337`*^9}, {3.84424797922554*^9, 
   3.8442479801930647`*^9}, {3.844248117942176*^9, 3.844248157227189*^9}, {
   3.8442482328799887`*^9, 3.844248233223262*^9}, {3.844248266732719*^9, 
   3.8442483123550167`*^9}, {3.8442483585112247`*^9, 3.84424841592831*^9}, {
   3.8442485499717627`*^9, 3.844248623769928*^9}, {3.844248665107697*^9, 
   3.844248667097089*^9}, {3.844248751362125*^9, 3.844248777461934*^9}, {
   3.844248837034648*^9, 3.844248864637895*^9}, {3.8442490519517937`*^9, 
   3.844249074611058*^9}, {3.844249107737136*^9, 3.8442491276681356`*^9}, {
   3.844249162818617*^9, 3.844249207281906*^9}, {3.844249333287755*^9, 
   3.844249354651156*^9}, {3.844249395635714*^9, 3.8442494043483973`*^9}, {
   3.8442494539649363`*^9, 3.844249457492577*^9}, {3.844249563560442*^9, 
   3.844249581857334*^9}, {3.844249629546159*^9, 3.844249631586163*^9}, {
   3.844249685699497*^9, 3.8442498193369017`*^9}, {3.8442498630571632`*^9, 
   3.844250043438158*^9}, {3.84425007554845*^9, 3.844250101743532*^9}, {
   3.844250286374707*^9, 3.844250302835019*^9}, {3.844250359786124*^9, 
   3.844250362675643*^9}, {3.8442503968653603`*^9, 3.844250454657114*^9}, {
   3.84425049762409*^9, 3.844250616947534*^9}, {3.844250697864221*^9, 
   3.84425069816825*^9}, {3.844250743831031*^9, 3.84425113538941*^9}, {
   3.8442511856415977`*^9, 3.844251283237122*^9}, {3.844251317547226*^9, 
   3.844251389109948*^9}, {3.8442514791653547`*^9, 3.844251479612804*^9}, {
   3.844307725095766*^9, 3.844307740529133*^9}, {3.8443077797037067`*^9, 
   3.8443077905768023`*^9}},
 CellLabel->
  "In[268]:=",ExpressionUUID->"1dd7e958-179c-48ba-8aca-5b39ff746f26"],

Cell[BoxData[
 TemplateBox[{
   GraphicsBox[{{{
       CapForm[None], 
       Directive[
        RGBColor[0.982864, 0.7431472, 0.3262672]], {{}, {{{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{0.5, 0.0027713787197113033`}, {1.5, 
                    0.0027713787197113033`}, {1.5, 0.0025567200478259556`}, {
                    0.5, 0.0025567200478259556`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{1.5, 0.0026534170785055496`}, {0.5, 
                    0.0026534170785055496`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{1., 0.0025567200478259556`}, {1., 
                    0.0004132629519681865}}, {{1., 0.0027713787197113033`}, {
                    1., 0.0032663557643093193`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{1.25, 0.0004132629519681865}, {0.75, 
                    0.0004132629519681865}}, {{1.25, 
                    0.0032663557643093193`}, {0.75, 
                    0.0032663557643093193`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.00326635576430931926`18.51406348537978"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.002771378719711303264`18.141665882208528"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.002653417078505549429`18.122775524449086"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.002556720047825955392`18.106653181192804"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.0004132629519681864784`18.616226473568755"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.00326635576430931926`18.51406348537978}, {
                    Style["75%", Bold], 
                    0.002771378719711303264`18.141665882208528}, {
                    Style["median", Bold], 
                    0.002653417078505549429`18.122775524449086}, {
                    Style["25%", Bold], 
                    0.002556720047825955392`18.106653181192804}, {
                    Style["min", Bold], 
                    0.0004132629519681864784`18.616226473568755}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{1.5, 0.0015115440748207833`}, {2.5, 
                    0.0015115440748207833`}, {2.5, 0.0014546867662269232`}, {
                    1.5, 0.0014546867662269232`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{2.5, 0.0014912064448637545`}, {1.5, 
                    0.0014912064448637545`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{2., 0.0014546867662269232`}, {2., 
                    0.001051472916607069}}, {{2., 0.0015115440748207833`}, {
                    2., 0.0015905070102729974`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{2.25, 0.001051472916607069}, {1.75, 
                    0.001051472916607069}}, {{2.25, 0.0015905070102729974`}, {
                    1.75, 0.0015905070102729974`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.001590507010272997415`18.201535587631483"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0015115440748207833315`17.878390819543128"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.00149120644486375447`17.872507776332725"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.001454686766226923229`17.861739492266715"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001051472916607069019`18.021798090793542"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.001590507010272997415`18.201535587631483}, {
                    Style["75%", Bold], 
                    0.0015115440748207833315`17.878390819543128}, {
                    Style["median", Bold], 
                    0.00149120644486375447`17.872507776332725}, {
                    Style["25%", Bold], 
                    0.001454686766226923229`17.861739492266715}, {
                    Style["min", Bold], 
                    0.001051472916607069019`18.021798090793542}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{2.5, 0.003835549479109653}, {3.5, 
                    0.003835549479109653}, {3.5, 0.0036372305870114303`}, {
                    2.5, 0.0036372305870114303`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{3.5, 0.0037461106631840944`}, {2.5, 
                    0.0037461106631840944`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{3., 0.0036372305870114303`}, {3., 
                    0.0031170728213747115`}}, {{3., 0.003835549479109653}, {
                    3., 0.0040689679052193}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{3.25, 0.0031170728213747115`}, {2.75, 
                    0.0031170728213747115`}}, {{3.25, 0.0040689679052193}, {
                    2.75, 0.0040689679052193}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.004068967905219300282`18.609484264284074"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.003835549479109653156`18.282797593912022"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.003746110663184094424`18.272550606980236"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0036372305870114303265`18.259740838932732"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.003117072821374711547`18.493746948427553"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.004068967905219300282`18.609484264284074}, {
                    Style["75%", Bold], 
                    0.003835549479109653156`18.282797593912022}, {
                    Style["median", Bold], 
                    0.003746110663184094424`18.272550606980236}, {
                    Style["25%", Bold], 
                    0.0036372305870114303265`18.259740838932732}, {
                    Style["min", Bold], 
                    0.003117072821374711547`18.493746948427553}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{3.5, 0.0019114654254558463`}, {4.5, 
                    0.0019114654254558463`}, {4.5, 0.0018094552470453655`}, {
                    3.5, 0.0018094552470453655`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{4.5, 0.0018571250861213705`}, {3.5, 
                    0.0018571250861213705`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{4., 0.0018094552470453655`}, {4., 
                    0.0016530935460798597`}}, {{4., 0.0019114654254558463`}, {
                    4., 0.00208970097557036}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{4.25, 0.0016530935460798597`}, {3.75, 
                    0.0016530935460798597`}}, {{4.25, 0.00208970097557036}, {
                    3.75, 0.00208970097557036}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.002089700975570360063`18.32008414546476"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0019114654254558463305`17.980336451253166"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0018571250861213705035`17.96781116083979"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0018094552470453654625`17.956517850580127"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001653093546079859727`18.218297430339003"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.002089700975570360063`18.32008414546476}, {
                    Style["75%", Bold], 
                    0.0019114654254558463305`17.980336451253166}, {
                    Style["median", Bold], 
                    0.0018571250861213705035`17.96781116083979}, {
                    Style["25%", Bold], 
                    0.0018094552470453654625`17.956517850580127}, {
                    Style["min", Bold], 
                    0.001653093546079859727`18.218297430339003}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{4.5, 0.003883419292856784}, {5.5, 
                    0.003883419292856784}, {5.5, 0.0035283309558304075`}, {
                    4.5, 0.0035283309558304075`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{5.5, 0.0037342167945908548`}, {4.5, 
                    0.0037342167945908548`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{5., 0.0035283309558304075`}, {5., 
                    0.0029113125890462424`}}, {{5., 0.003883419292856784}, {
                    5., 0.004373521601474166}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{5.25, 0.0029113125890462424`}, {4.75, 
                    0.0029113125890462424`}}, {{5.25, 0.004373521601474166}, {
                    4.75, 0.004373521601474166}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.004373521601474165618`18.64083127591178"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0038834192928567838955`18.28818428819733"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.00373421679459085454`18.271169532186192"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0035283309558304075395`18.24653931933029"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.00291131258904624244`18.464088838351746"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.004373521601474165618`18.64083127591178}, {
                    Style["75%", Bold], 
                    0.0038834192928567838955`18.28818428819733}, {
                    Style["median", Bold], 
                    0.00373421679459085454`18.271169532186192}, {
                    Style["25%", Bold], 
                    0.0035283309558304075395`18.24653931933029}, {
                    Style["min", Bold], 
                    0.00291131258904624244`18.464088838351746}}, Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{5.5, 0.0020437196603000606`}, {6.5, 
                    0.0020437196603000606`}, {6.5, 0.0018969059154127085`}, {
                    5.5, 0.0018969059154127085`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{6.5, 0.001974164914438431}, {5.5, 
                    0.001974164914438431}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{6., 0.0018969059154127085`}, {6., 
                    0.0017053724252069549`}}, {{6., 0.0020437196603000606`}, {
                    6., 0.0021995626834945417`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{6.25, 0.0017053724252069549`}, {5.75, 
                    0.0017053724252069549`}}, {{6.25, 
                    0.0021995626834945417`}, {5.75, 
                    0.0021995626834945417`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.002199562683494541739`18.34233634308391"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0020437196603000603365`18.009391327141813"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.001974164914438430833`17.994353433540464"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0018969059154127084715`17.977015795198117"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001705372425206954853`18.23181923643708"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.002199562683494541739`18.34233634308391}, {
                    Style["75%", Bold], 
                    0.0020437196603000603365`18.009391327141813}, {
                    Style["median", Bold], 
                    0.001974164914438430833`17.994353433540464}, {
                    Style["25%", Bold], 
                    0.0018969059154127084715`17.977015795198117}, {
                    Style["min", Bold], 
                    0.001705372425206954853`18.23181923643708}}, Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{6.5, 0.0028203240880618897`}, {7.5, 
                    0.0028203240880618897`}, {7.5, 0.002499659121328686}, {
                    6.5, 0.002499659121328686}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{7.5, 0.002655650228764206}, {6.5, 
                    0.002655650228764206}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{7., 0.002499659121328686}, {7., 
                    0.002145039104243589}}, {{7., 0.0028203240880618897`}, {
                    7., 0.0032115425846696894`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{7.25, 0.002145039104243589}, {6.75, 
                    0.002145039104243589}}, {{7.25, 0.0032115425846696894`}, {
                    6.75, 0.0032115425846696894`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.003211542584669689355`18.50671368508107"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.002820324088061889733`18.14926902101344"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0026556502287642062135`18.123140878601017"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.002499659121328685809`18.096850792280172"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.002145039104243589081`18.331435213817905"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.003211542584669689355`18.50671368508107}, {
                    Style["75%", Bold], 
                    0.002820324088061889733`18.14926902101344}, {
                    Style["median", Bold], 
                    0.0026556502287642062135`18.123140878601017}, {
                    Style["25%", Bold], 
                    0.002499659121328685809`18.096850792280172}, {
                    Style["min", Bold], 
                    0.002145039104243589081`18.331435213817905}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{7.5, 0.00165018409970521}, {8.5, 
                    0.00165018409970521}, {8.5, 0.0015452942277231596`}, {7.5,
                     0.0015452942277231596`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{8.5, 0.0015937614332492088`}, {7.5, 
                    0.0015937614332492088`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{8., 0.0015452942277231596`}, {8., 
                    0.0012675631833481485`}}, {{8., 0.00165018409970521}, {8.,
                     0.0017318685164855285`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{8.25, 0.0012675631833481485`}, {7.75, 
                    0.0012675631833481485`}}, {{8.25, 
                    0.0017318685164855285`}, {7.75, 
                    0.0017318685164855285`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.001731868516485528513`18.238514917281584"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.001650184099705210086`17.916502402505078"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0015937614332492088235`17.901393317646114"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0015452942277231595645`17.88798118667996"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001267563183348148492`18.102969616522568"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.001731868516485528513`18.238514917281584}, {
                    Style["75%", Bold], 
                    0.001650184099705210086`17.916502402505078}, {
                    Style["median", Bold], 
                    0.0015937614332492088235`17.901393317646114}, {
                    Style["25%", Bold], 
                    0.0015452942277231595645`17.88798118667996}, {
                    Style["min", Bold], 
                    0.001267563183348148492`18.102969616522568}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{8.5, 0.0033965112161331063`}, {9.5, 
                    0.0033965112161331063`}, {9.5, 0.003184984050028543}, {
                    8.5, 0.003184984050028543}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{9.5, 0.0032728568229028906`}, {8.5, 
                    0.0032728568229028906`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{9., 0.003184984050028543}, {9., 
                    0.002606833367933783}}, {{9., 0.0033965112161331063`}, {
                    9., 0.0036802662309803583`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{9.25, 0.002606833367933783}, {8.75, 
                    0.002606833367933783}}, {{9.25, 0.0036802662309803583`}, {
                    8.75, 0.0036802662309803583`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.003680266230980358284`18.56587923673425"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.003396511216133106265`18.23000305741459"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.00327285682290289078`18.213897011054563"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0031849840500285428025`18.20207726612452"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.002606833367933783074`18.416113271406257"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.003680266230980358284`18.56587923673425}, {
                    Style["75%", Bold], 
                    0.003396511216133106265`18.23000305741459}, {
                    Style["median", Bold], 
                    0.00327285682290289078`18.213897011054563}, {
                    Style["25%", Bold], 
                    0.0031849840500285428025`18.20207726612452}, {
                    Style["min", Bold], 
                    0.002606833367933783074`18.416113271406257}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{9.5, 0.002080625953057833}, {10.5, 
                    0.002080625953057833}, {10.5, 0.001967332215498583}, {9.5,
                     0.001967332215498583}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{10.5, 0.0020332865831582266`}, {9.5, 
                    0.0020332865831582266`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{10., 0.001967332215498583}, {10., 
                    0.0017701930499833117`}}, {{10., 0.002080625953057833}, {
                    10., 0.0022469008344320933`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{10.25, 0.0017701930499833117`}, {9.75, 
                    0.0017701930499833117`}}, {{10.25, 
                    0.0022469008344320933`}, {9.75, 
                    0.0022469008344320933`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.002246900834432093326`18.351583905525807"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0020806259530578331825`18.017164015771055"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0020332865831582266035`18.007168599261636"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.001967332215498582976`17.992847708014995"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001770193049983311744`18.248020631316987"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.002246900834432093326`18.351583905525807}, {
                    Style["75%", Bold], 
                    0.0020806259530578331825`18.017164015771055}, {
                    Style["median", Bold], 
                    0.0020332865831582266035`18.007168599261636}, {
                    Style["25%", Bold], 
                    0.001967332215498582976`17.992847708014995}, {
                    Style["min", Bold], 
                    0.001770193049983311744`18.248020631316987}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{10.5, 0.0031333377592164887`}, {11.5, 
                    0.0031333377592164887`}, {11.5, 0.002875002387592382}, {
                    10.5, 0.002875002387592382}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{11.5, 0.002996227863346027}, {10.5, 
                    0.002996227863346027}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{11., 0.002875002387592382}, {11., 
                    0.002612553631228859}}, {{11., 0.0031333377592164887`}, {
                    11., 0.003439599752072365}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{11.25, 0.002612553631228859}, {10.75, 
                    0.002612553631228859}}, {{11.25, 0.003439599752072365}, {
                    10.75, 0.003439599752072365}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.003439599752072365103`18.536507908972826"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.00313333775921648865`18.19497721666348"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0029962278633460267925`18.17554484274621"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0028750023875923820005`18.157608214028716"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.002612553631228859211`18.417065214528748"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.003439599752072365103`18.536507908972826}, {
                    Style["75%", Bold], 
                    0.00313333775921648865`18.19497721666348}, {
                    Style["median", Bold], 
                    0.0029962278633460267925`18.17554484274621}, {
                    Style["25%", Bold], 
                    0.0028750023875923820005`18.157608214028716}, {
                    Style["min", Bold], 
                    0.002612553631228859211`18.417065214528748}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{11.5, 0.0017936285191796995`}, {12.5, 
                    0.0017936285191796995`}, {12.5, 0.001697402969700552}, {
                    11.5, 0.001697402969700552}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{12.5, 0.0017521543689560447`}, {11.5, 
                    0.0017521543689560447`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{12., 0.001697402969700552}, {12., 
                    0.0015834275360184463`}}, {{12., 
                    0.0017936285191796995`}, {12., 
                    0.0018968004660494895`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{12.25, 0.0015834275360184463`}, {11.75, 
                    0.0015834275360184463`}}, {{12.25, 
                    0.0018968004660494895`}, {11.75, 
                    0.0018968004660494895`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.0018968004660494895`18.278021647677583"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.001793628519179699468`17.952702505041813"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0017521543689560447685`17.94254237022769"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0016974029697005520425`17.928754961999577"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001583427536018446307`18.199598193108987"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.0018968004660494895`18.278021647677583}, {
                    Style["75%", Bold], 
                    0.001793628519179699468`17.952702505041813}, {
                    Style["median", Bold], 
                    0.0017521543689560447685`17.94254237022769}, {
                    Style["25%", Bold], 
                    0.0016974029697005520425`17.928754961999577}, {
                    Style["min", Bold], 
                    0.001583427536018446307`18.199598193108987}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{12.5, 0.0031448838672602283`}, {13.5, 
                    0.0031448838672602283`}, {13.5, 0.0028588996990526684`}, {
                    12.5, 0.0028588996990526684`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{13.5, 0.0030170669209578886`}, {12.5, 
                    0.0030170669209578886`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{13., 0.0028588996990526684`}, {13., 
                    0.002349126878860369}}, {{13., 0.0031448838672602283`}, {
                    13., 0.003517966402538006}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{13.25, 0.002349126878860369}, {12.75, 
                    0.002349126878860369}}, {{13.25, 0.003517966402538006}, {
                    12.75, 0.003517966402538006}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.003517966402538005941`18.546291687519957"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0031448838672602284855`18.196574616998298"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0030170669209578888315`18.178554947616874"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.002858899699052668431`18.155168923278453"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.002349126878860369021`18.370906474121508"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.003517966402538005941`18.546291687519957}, {
                    Style["75%", Bold], 
                    0.0031448838672602284855`18.196574616998298}, {
                    Style["median", Bold], 
                    0.0030170669209578888315`18.178554947616874}, {
                    Style["25%", Bold], 
                    0.002858899699052668431`18.155168923278453}, {
                    Style["min", Bold], 
                    0.002349126878860369021`18.370906474121508}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{13.5, 0.0017193066967157223`}, {14.5, 
                    0.0017193066967157223`}, {14.5, 0.0016230351749522034`}, {
                    13.5, 0.0016230351749522034`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{14.5, 0.0016829585237510265`}, {13.5, 
                    0.0016829585237510265`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{14., 0.0016230351749522034`}, {14., 
                    0.0014661690535471015`}}, {{14., 
                    0.0017193066967157223`}, {14., 
                    0.0018859527233807483`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{14.25, 0.0014661690535471015`}, {13.75, 
                    0.0014661690535471015`}}, {{14.25, 
                    0.0018859527233807483`}, {13.75, 
                    0.0018859527233807483`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.001885952723380748298`18.275530801745845"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.001719306696715722314`17.93432335909781"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0016829585237510266215`17.925043417324307"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0016230351749522033265`17.909297936437113"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001466169053547101454`18.166184048606457"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.001885952723380748298`18.275530801745845}, {
                    Style["75%", Bold], 
                    0.001719306696715722314`17.93432335909781}, {
                    Style["median", Bold], 
                    0.0016829585237510266215`17.925043417324307}, {
                    Style["25%", Bold], 
                    0.0016230351749522033265`17.909297936437113}, {
                    Style["min", Bold], 
                    0.001466169053547101454`18.166184048606457}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{14.5, 0.004149678727249112}, {15.5, 
                    0.004149678727249112}, {15.5, 0.0038675734080335306`}, {
                    14.5, 0.0038675734080335306`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{15.5, 0.003976150560241716}, {14.5, 
                    0.003976150560241716}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{15., 0.0038675734080335306`}, {15., 
                    0.0030721352947617854`}}, {{15., 0.004149678727249112}, {
                    15., 0.004580613892754711}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{15.25, 0.0030721352947617854`}, {14.75, 
                    0.0030721352947617854`}}, {{15.25, 
                    0.004580613892754711}, {14.75, 
                    0.004580613892754711}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.004580613892754711175`18.660923685944816"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0041496787272491124535`18.316984478786924"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.00397615056024171621`18.298432825293734"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0038675734080335305925`18.28640856986226"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.003072135294761785436`18.48744033781606"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.004580613892754711175`18.660923685944816}, {
                    Style["75%", Bold], 
                    0.0041496787272491124535`18.316984478786924}, {
                    Style["median", Bold], 
                    0.00397615056024171621`18.298432825293734}, {
                    Style["25%", Bold], 
                    0.0038675734080335305925`18.28640856986226}, {
                    Style["min", Bold], 
                    0.003072135294761785436`18.48744033781606}}, Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{15.5, 0.0025133539750172747`}, {16.5, 
                    0.0025133539750172747`}, {16.5, 0.002375804445924943}, {
                    15.5, 0.002375804445924943}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{16.5, 0.002442238993385482}, {15.5, 
                    0.002442238993385482}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{16., 0.002375804445924943}, {16., 
                    0.002223256356902472}}, {{16., 0.0025133539750172747`}, {
                    16., 0.002735608238733183}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{16.25, 0.002223256356902472}, {15.75, 
                    0.002223256356902472}}, {{16.25, 0.002735608238733183}, {
                    15.75, 0.002735608238733183}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.002735608238733183012`18.43705390301207"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.002513353975017274672`18.099223662276298"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0024422389933854821675`18.0867581653494"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0023758044459249430445`18.07478069504296"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.002223256356902471829`18.346989542757058"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.002735608238733183012`18.43705390301207}, {
                    Style["75%", Bold], 
                    0.002513353975017274672`18.099223662276298}, {
                    Style["median", Bold], 
                    0.0024422389933854821675`18.0867581653494}, {
                    Style["25%", Bold], 
                    0.0023758044459249430445`18.07478069504296}, {
                    Style["min", Bold], 
                    0.002223256356902471829`18.346989542757058}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{16.5, 0.004112186242402017}, {17.5, 
                    0.004112186242402017}, {17.5, 0.0037914738296074223`}, {
                    16.5, 0.0037914738296074223`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{17.5, 0.0039419445286446465`}, {16.5, 
                    0.0039419445286446465`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{17., 0.0037914738296074223`}, {17., 
                    0.0033648157558248404`}}, {{17., 0.004112186242402017}, {
                    17., 0.004454577112424156}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{17.25, 0.0033648157558248404`}, {16.75, 
                    0.0033648157558248404`}}, {{17.25, 
                    0.004454577112424156}, {16.75, 
                    0.004454577112424156}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.004454577112424156285`18.648806481334063"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.004112186242402017175`18.31304278012281"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0039419445286446464645`18.294680512896125"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.003791473829607422321`18.277778066980552"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.003364815755824840382`18.52696128894061"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.004454577112424156285`18.648806481334063}, {
                    Style["75%", Bold], 
                    0.004112186242402017175`18.31304278012281}, {
                    Style["median", Bold], 
                    0.0039419445286446464645`18.294680512896125}, {
                    Style["25%", Bold], 
                    0.003791473829607422321`18.277778066980552}, {
                    Style["min", Bold], 
                    0.003364815755824840382`18.52696128894061}}, Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{17.5, 0.0018103272795214206`}, {18.5, 
                    0.0018103272795214206`}, {18.5, 0.0017337043197918197`}, {
                    17.5, 0.0017337043197918197`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{18.5, 0.0017770311960212549`}, {17.5, 
                    0.0017770311960212549`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    LineBox[{{{18., 0.0017337043197918197`}, {18., 
                    0.0015917688562945027`}}, {{18., 
                    0.0018103272795214206`}, {18., 
                    0.0020154276177866094`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{18.25, 0.0015917688562945027`}, {17.75, 
                    0.0015917688562945027`}}, {{18.25, 
                    0.0020154276177866094`}, {17.75, 
                    0.0020154276177866094`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.002015427617786609386`18.30436720548568"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.001810327279521420688`17.956727100112076"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0017770311960212549885`17.948665056306186"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.001733704319791819627`17.937945035635124"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001591768856294502668`18.201880003273526"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.002015427617786609386`18.30436720548568}, {
                    Style["75%", Bold], 
                    0.001810327279521420688`17.956727100112076}, {
                    Style["median", Bold], 
                    0.0017770311960212549885`17.948665056306186}, {
                    Style["25%", Bold], 
                    0.001733704319791819627`17.937945035635124}, {
                    Style["min", Bold], 
                    0.001591768856294502668`18.201880003273526}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    PolygonBox[{{18.5, 0.004349232264370635}, {19.5, 
                    0.004349232264370635}, {19.5, 0.003998098219557869}, {
                    18.5, 0.003998098219557869}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{19.5, 0.004193328847765281}, {18.5, 
                    0.004193328847765281}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{19., 0.003998098219557869}, {19., 
                    0.003616142164389387}}, {{19., 0.004349232264370635}, {
                    19., 0.0050288866194652245`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{19.25, 0.003616142164389387}, {18.75, 
                    0.003616142164389387}}, {{19.25, 
                    0.0050288866194652245`}, {18.75, 
                    0.0050288866194652245`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.005028886619465224549`18.701471844192078"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0043492322643706353775`18.33738260548055"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.004193328847765281659`18.321528926164756"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0039980982195578686905`18.30082346337475"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.003616142164389386793`18.558245495917312"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.005028886619465224549`18.701471844192078}, {
                    Style["75%", Bold], 
                    0.0043492322643706353775`18.33738260548055}, {
                    Style["median", Bold], 
                    0.004193328847765281659`18.321528926164756}, {
                    Style["25%", Bold], 
                    0.0039980982195578686905`18.30082346337475}, {
                    Style["min", Bold], 
                    0.003616142164389386793`18.558245495917312}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{19.5, 0.002120330847475975}, {20.5, 
                    0.002120330847475975}, {20.5, 0.0019778702601815543`}, {
                    19.5, 0.0019778702601815543`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{20.5, 0.0020517399371499977`}, {19.5, 
                    0.0020517399371499977`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{20., 0.0019778702601815543`}, {20., 
                    0.0018720297984481903`}}, {{20., 0.002120330847475975}, {
                    20., 0.002445267866599179}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{20.25, 0.0018720297984481903`}, {19.75, 
                    0.0018720297984481903`}}, {{20.25, 
                    0.002445267866599179}, {19.75, 
                    0.002445267866599179}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.002445267866599178802`18.38832644080681"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0021203308474759751615`18.025373636030128"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0020517399371499977015`18.011092316419877"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.001977870260181554098`17.995167804673418"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001872029798448190258`18.27231275743554"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.002445267866599178802`18.38832644080681}, {
                    Style["75%", Bold], 
                    0.0021203308474759751615`18.025373636030128}, {
                    Style["median", Bold], 
                    0.0020517399371499977015`18.011092316419877}, {
                    Style["25%", Bold], 
                    0.001977870260181554098`17.995167804673418}, {
                    Style["min", Bold], 
                    0.001872029798448190258`18.27231275743554}}, Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{20.5, 0.00330569599463818}, {21.5, 
                    0.00330569599463818}, {21.5, 0.003048552277486948}, {20.5,
                     0.003048552277486948}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{21.5, 0.0031850498018002713`}, {20.5, 
                    0.0031850498018002713`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{21., 0.003048552277486948}, {21., 
                    0.002780195978041068}}, {{21., 0.00330569599463818}, {21.,
                     0.0037147642453425255`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{21.25, 0.002780195978041068}, {20.75, 
                    0.002780195978041068}}, {{21.25, 
                    0.0037147642453425255`}, {20.75, 
                    0.0037147642453425255`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.003714764245342525549`18.569931256805692"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0033056959946381801825`18.21823291590604"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0031850498018002712695`18.2020862317383"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.003048552277486947862`18.18306365116958"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.002780195978041067901`18.44407541073172"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.003714764245342525549`18.569931256805692}, {
                    Style["75%", Bold], 
                    0.0033056959946381801825`18.21823291590604}, {
                    Style["median", Bold], 
                    0.0031850498018002712695`18.2020862317383}, {
                    Style["25%", Bold], 
                    0.003048552277486947862`18.18306365116958}, {
                    Style["min", Bold], 
                    0.002780195978041067901`18.44407541073172}}, Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{21.5, 0.0017978628989881343`}, {22.5, 
                    0.0017978628989881343`}, {22.5, 0.0017192757435309121`}, {
                    21.5, 0.0017192757435309121`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{22.5, 0.0017565974186857583`}, {21.5, 
                    0.0017565974186857583`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{22., 0.0017192757435309121`}, {22., 
                    0.0015451841764193208`}}, {{22., 
                    0.0017978628989881343`}, {22., 
                    0.0019324975097943192`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{22.25, 0.0015451841764193208`}, {21.75, 
                    0.0015451841764193208`}}, {{22.25, 
                    0.0019324975097943192`}, {21.75, 
                    0.0019324975097943192`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.001932497509794319206`18.286118942961238"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0017978628989881342665`17.953726574668078"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.001756597418685758305`17.943642244558262"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.001719275743530912113`17.934315540295966"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001545184176419320786`18.18898025206859"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.001932497509794319206`18.286118942961238}, {
                    Style["75%", Bold], 
                    0.0017978628989881342665`17.953726574668078}, {
                    Style["median", Bold], 
                    0.001756597418685758305`17.943642244558262}, {
                    Style["25%", Bold], 
                    0.001719275743530912113`17.934315540295966}, {
                    Style["min", Bold], 
                    0.001545184176419320786`18.18898025206859}}, Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{22.5, 0.004039531896087797}, {23.5, 
                    0.004039531896087797}, {23.5, 0.0036573955559705278`}, {
                    22.5, 0.0036573955559705278`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{23.5, 0.0038307020779998905`}, {22.5, 
                    0.0038307020779998905`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{23., 0.0036573955559705278`}, {23., 
                    0.0032175456573271194`}}, {{23., 0.004039531896087797}, {
                    23., 0.004664205489914768}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{23.25, 0.0032175456573271194`}, {22.75, 
                    0.0032175456573271194`}}, {{23.25, 
                    0.004664205489914768}, {22.75, 
                    0.004664205489914768}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.004664205489914767869`18.668777675792587"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0040395318960877966975`18.30530104599995"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0038307020779998902495`18.282248381609655"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0036573955559705275625`18.262141937188506"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.003217545657327119425`18.507524718306662"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.004664205489914767869`18.668777675792587}, {
                    Style["75%", Bold], 
                    0.0040395318960877966975`18.30530104599995}, {
                    Style["median", Bold], 
                    0.0038307020779998902495`18.282248381609655}, {
                    Style["25%", Bold], 
                    0.0036573955559705275625`18.262141937188506}, {
                    Style["min", Bold], 
                    0.003217545657327119425`18.507524718306662}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    PolygonBox[{{23.5, 0.0018592387513821137`}, {24.5, 
                    0.0018592387513821137`}, {24.5, 0.0017561843850129092`}, {
                    23.5, 0.0017561843850129092`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{24.5, 0.0018112245250430938`}, {23.5, 
                    0.0018112245250430938`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{24., 0.0017561843850129092`}, {24., 
                    0.001592136801953531}}, {{24., 0.0018592387513821137`}, {
                    24., 0.002037233426841773}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{24.25, 0.001592136801953531}, {23.75, 
                    0.001592136801953531}}, {{24.25, 0.002037233426841773}, {
                    23.75, 0.002037233426841773}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.002037233426841773137`18.309040793448492"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.001859238751382113683`17.968305166969678"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0018112245250430936965`17.956942294486186"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0017561843850129090765`17.943540115672484"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001592136801953530998`18.201980381103287"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.002037233426841773137`18.309040793448492}, {
                    Style["75%", Bold], 
                    0.001859238751382113683`17.968305166969678}, {
                    Style["median", Bold], 
                    0.0018112245250430936965`17.956942294486186}, {
                    Style["25%", Bold], 
                    0.0017561843850129090765`17.943540115672484}, {
                    Style["min", Bold], 
                    0.001592136801953530998`18.201980381103287}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{24.5, 0.004890724701069026}, {25.5, 
                    0.004890724701069026}, {25.5, 0.004449538848242119}, {
                    24.5, 0.004449538848242119}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{25.5, 0.004684707929157768}, {24.5, 
                    0.004684707929157768}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{25., 0.004449538848242119}, {25., 
                    0.003992430973145921}}, {{25., 0.004890724701069026}, {
                    25., 0.005336119444453318}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{25.25, 0.003992430973145921}, {24.75, 
                    0.003992430973145921}}, {{25.25, 0.005336119444453318}, {
                    24.75, 0.005336119444453318}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.005336119444453318178`18.727225542326483"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.004890724701069025255`18.3883432214056"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0046847079291577678475`18.369652524061603"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.00444953884824211875`18.347285007217685"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.003992430973145921422`18.60123741617158"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.005336119444453318178`18.727225542326483}, {
                    Style["75%", Bold], 
                    0.004890724701069025255`18.3883432214056}, {
                    Style["median", Bold], 
                    0.0046847079291577678475`18.369652524061603}, {
                    Style["25%", Bold], 
                    0.00444953884824211875`18.347285007217685}, {
                    Style["min", Bold], 
                    0.003992430973145921422`18.60123741617158}}, Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{25.5, 0.002046080738925489}, {26.5, 
                    0.002046080738925489}, {26.5, 0.0018986217452007534`}, {
                    25.5, 0.0018986217452007534`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{26.5, 0.00198899231526875}, {25.5, 
                    0.00198899231526875}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{26., 0.0018986217452007534`}, {26., 
                    0.001727745371507012}}, {{26., 0.002046080738925489}, {
                    26., 0.002429596391154091}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{26.25, 0.001727745371507012}, {25.75, 
                    0.001727745371507012}}, {{26.25, 0.002429596391154091}, {
                    25.75, 0.002429596391154091}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.002429596391154090901`18.385534133823352"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.00204608073892548919`18.009892771433556"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0019889923152687503155`17.997603109510315"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0018986217452007535025`17.97740845494202"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001727745371507011934`18.23747973820205"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.002429596391154090901`18.385534133823352}, {
                    Style["75%", Bold], 
                    0.00204608073892548919`18.009892771433556}, {
                    Style["median", Bold], 
                    0.0019889923152687503155`17.997603109510315}, {
                    Style["25%", Bold], 
                    0.0018986217452007535025`17.97740845494202}, {
                    Style["min", Bold], 
                    0.001727745371507011934`18.23747973820205}}, Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{26.5, 0.004485685522008987}, {27.5, 
                    0.004485685522008987}, {27.5, 0.004159716891049288}, {
                    26.5, 0.004159716891049288}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{27.5, 0.004331910475126027}, {26.5, 
                    0.004331910475126027}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{27., 0.004159716891049288}, {27., 
                    0.003936847717250228}}, {{27., 0.004485685522008987}, {
                    27., 0.00504228961786935}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{27.25, 0.003936847717250228}, {26.75, 
                    0.003936847717250228}}, {{27.25, 0.00504228961786935}, {
                    26.75, 0.00504228961786935}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.00504228961786934958`18.702627786963237"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.004485685522008987357`18.350798827563455"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0043319104751260262105`18.33564947709066"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0041597168910492876745`18.3180337780303"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.003936847717250228224`18.59514861600003"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.00504228961786934958`18.702627786963237}, {
                    Style["75%", Bold], 
                    0.004485685522008987357`18.350798827563455}, {
                    Style["median", Bold], 
                    0.0043319104751260262105`18.33564947709066}, {
                    Style["25%", Bold], 
                    0.0041597168910492876745`18.3180337780303}, {
                    Style["min", Bold], 
                    0.003936847717250228224`18.59514861600003}}, Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{27.5, 0.0020225295134996472`}, {28.5, 
                    0.0020225295134996472`}, {28.5, 0.0019168791374094753`}, {
                    27.5, 0.0019168791374094753`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{28.5, 0.00198835172172345}, {27.5, 
                    0.00198835172172345}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{28., 0.0019168791374094753`}, {28., 
                    0.0017653170390285852`}}, {{28., 
                    0.0020225295134996472`}, {28., 0.00225682206079118}}}]}, {
                    
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{28.25, 0.0017653170390285852`}, {27.75, 
                    0.0017653170390285852`}}, {{28.25, 0.00225682206079118}, {
                    27.75, 0.00225682206079118}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.002256822060791180157`18.35349731846504"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.002022529513499647224`18.004864872052476"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0019883517217234500645`17.997463214021423"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0019168791374094754215`17.981564735048774"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001765317039028585239`18.246822713087003"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.002256822060791180157`18.35349731846504}, {
                    Style["75%", Bold], 
                    0.002022529513499647224`18.004864872052476}, {
                    Style["median", Bold], 
                    0.0019883517217234500645`17.997463214021423}, {
                    Style["25%", Bold], 
                    0.0019168791374094754215`17.981564735048774}, {
                    Style["min", Bold], 
                    0.001765317039028585239`18.246822713087003}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{28.5, 0.0025169113565991132`}, {29.5, 
                    0.0025169113565991132`}, {29.5, 0.0022661015830502777`}, {
                    28.5, 0.0022661015830502777`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{29.5, 0.0024050766522363994`}, {28.5, 
                    0.0024050766522363994`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{29., 0.0022661015830502777`}, {29., 
                    0.0019197278155037999`}}, {{29., 
                    0.0025169113565991132`}, {29., 
                    0.0029979194923658277`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{29.25, 0.0019197278155037999`}, {28.75, 
                    0.0019197278155037999`}}, {{29.25, 
                    0.0029979194923658277`}, {28.75, 
                    0.0029979194923658277`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.002997919492365827727`18.476819965906945"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.002516911356599113017`18.09983792468463"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0024050766522363993535`18.08009892667281"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0022661015830502777295`18.054249378517127"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001919727815503799884`18.28323965755547"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.002997919492365827727`18.476819965906945}, {
                    Style["75%", Bold], 
                    0.002516911356599113017`18.09983792468463}, {
                    Style["median", Bold], 
                    0.0024050766522363993535`18.08009892667281}, {
                    Style["25%", Bold], 
                    0.0022661015830502777295`18.054249378517127}, {
                    Style["min", Bold], 
                    0.001919727815503799884`18.28323965755547}}, Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{29.5, 0.0016842289485704722`}, {30.5, 
                    0.0016842289485704722`}, {30.5, 0.001599213276120913}, {
                    29.5, 0.001599213276120913}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{30.5, 0.001640812834541356}, {29.5, 
                    0.001640812834541356}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{30., 0.001599213276120913}, {30., 
                    0.0013734285771054683`}}, {{30., 
                    0.0016842289485704722`}, {30., 
                    0.0018197818198631777`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{30.25, 0.0013734285771054683`}, {29.75, 
                    0.0013734285771054683`}}, {{30.25, 
                    0.0018197818198631777`}, {29.75, 
                    0.0018197818198631777`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.001819781819863177698`18.260019321990857"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.001684228948570472241`17.925371132082972"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.001640812834541356007`17.91402904878841"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0015992132761209130715`17.902876390825092"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001373428577105468337`18.137806079573473"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.001819781819863177698`18.260019321990857}, {
                    Style["75%", Bold], 
                    0.001684228948570472241`17.925371132082972}, {
                    Style["median", Bold], 
                    0.001640812834541356007`17.91402904878841}, {
                    Style["25%", Bold], 
                    0.0015992132761209130715`17.902876390825092}, {
                    Style["min", Bold], 
                    0.001373428577105468337`18.137806079573473}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{30.5, 0.004286356565110973}, {31.5, 
                    0.004286356565110973}, {31.5, 0.0039839586240434455`}, {
                    30.5, 0.0039839586240434455`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{31.5, 0.00416689083339075}, {30.5, 
                    0.00416689083339075}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{31., 0.0039839586240434455`}, {31., 
                    0.0034561897318807554`}}, {{31., 0.004286356565110973}, {
                    31., 0.004819418483641048}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{31.25, 0.0034561897318807554`}, {30.75, 
                    0.0034561897318807554`}}, {{31.25, 
                    0.004819418483641048}, {30.75, 
                    0.004819418483641048}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.004819418483641048009`18.68299463894805"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.004286356565110972187`18.33105829979103"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0041668908333907499905`18.318782127045026"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.003983958624043445508`18.299284823685337"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.003456189731880755355`18.538597575602893"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.004819418483641048009`18.68299463894805}, {
                    Style["75%", Bold], 
                    0.004286356565110972187`18.33105829979103}, {
                    Style["median", Bold], 
                    0.0041668908333907499905`18.318782127045026}, {
                    Style["25%", Bold], 
                    0.003983958624043445508`18.299284823685337}, {
                    Style["min", Bold], 
                    0.003456189731880755355`18.538597575602893}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{31.5, 0.001953955623793078}, {32.5, 
                    0.001953955623793078}, {32.5, 0.0018532075173181934`}, {
                    31.5, 0.0018532075173181934`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{32.5, 0.001895822676313749}, {31.5, 
                    0.001895822676313749}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{32., 0.0018532075173181934`}, {32., 
                    0.001640278381538921}}, {{32., 0.001953955623793078}, {
                    32., 0.0021783594081035505`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    LineBox[{{{32.25, 0.001640278381538921}, {31.75, 
                    0.001640278381538921}}, {{32.25, 
                    0.0021783594081035505`}, {31.75, 
                    0.0021783594081035505`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.002178359408103550457`18.338129535694705"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.001953955623793077797`17.98988470058641"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.001895822676313749168`17.97676771798158"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0018532075173181934355`17.966894057535164"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001640278381538920905`18.21491756103937"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.002178359408103550457`18.338129535694705}, {
                    Style["75%", Bold], 
                    0.001953955623793077797`17.98988470058641}, {
                    Style["median", Bold], 
                    0.001895822676313749168`17.97676771798158}, {
                    Style["25%", Bold], 
                    0.0018532075173181934355`17.966894057535164}, {
                    Style["min", Bold], 
                    0.001640278381538920905`18.21491756103937}}, Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{32.5, 0.0033569366832244853`}, {33.5, 
                    0.0033569366832244853`}, {33.5, 0.0030416800360202815`}, {
                    32.5, 0.0030416800360202815`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{33.5, 0.0031858925728969903`}, {32.5, 
                    0.0031858925728969903`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{33., 0.0030416800360202815`}, {33., 
                    0.0025496084494989924`}}, {{33., 
                    0.0033569366832244853`}, {33., 
                    0.0037462485433933435`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{33.25, 0.0025496084494989924`}, {32.75, 
                    0.0025496084494989924`}}, {{33.25, 
                    0.0037462485433933435`}, {32.75, 
                    0.0037462485433933435`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.003746248543393343542`18.573596587092478"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0033569366832244850515`18.224913154227004"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0031858925728969903285`18.202201131800933"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0030416800360202815405`18.182083531640345"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.002549608449498992364`18.406473489736427"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.003746248543393343542`18.573596587092478}, {
                    Style["75%", Bold], 
                    0.0033569366832244850515`18.224913154227004}, {
                    Style["median", Bold], 
                    0.0031858925728969903285`18.202201131800933}, {
                    Style["25%", Bold], 
                    0.0030416800360202815405`18.182083531640345}, {
                    Style["min", Bold], 
                    0.002549608449498992364`18.406473489736427}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{33.5, 0.0019200521546006983`}, {34.5, 
                    0.0019200521546006983`}, {34.5, 0.0018222231656148029`}, {
                    33.5, 0.0018222231656148029`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{34.5, 0.0018649912866570415`}, {33.5, 
                    0.0018649912866570415`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{34., 0.0018222231656148029`}, {34., 
                    0.0015773860648681348`}}, {{34., 
                    0.0019200521546006983`}, {34., 0.002125514230281883}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{34.25, 0.0015773860648681348`}, {33.75, 
                    0.0015773860648681348`}}, {{34.25, 
                    0.002125514230281883}, {33.75, 
                    0.002125514230281883}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.002125514230281883195`18.327464016907097"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.001920052154600698454`17.98228302999148"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0018649912866570413995`17.969646811437503"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.00182222316561480289`17.959571567785293"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001577386064868134801`18.19793799981091"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.002125514230281883195`18.327464016907097}, {
                    Style["75%", Bold], 
                    0.001920052154600698454`17.98228302999148}, {
                    Style["median", Bold], 
                    0.0018649912866570413995`17.969646811437503}, {
                    Style["25%", Bold], 
                    0.00182222316561480289`17.959571567785293}, {
                    Style["min", Bold], 
                    0.001577386064868134801`18.19793799981091}}, Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{34.5, 0.002982249556278368}, {35.5, 
                    0.002982249556278368}, {35.5, 0.002673806515775787}, {
                    34.5, 0.002673806515775787}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{35.5, 0.002869273608044871}, {34.5, 
                    0.002869273608044871}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{35., 0.002673806515775787}, {35., 
                    0.0021097486558141025`}}, {{35., 0.002982249556278368}, {
                    35., 0.0034777875680945865`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{35.25, 0.0021097486558141025`}, {34.75, 
                    0.0021097486558141025`}}, {{35.25, 
                    0.0034777875680945865`}, {34.75, 
                    0.0034777875680945865`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.003477787568094586543`18.541303050690868"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0029822495562783681715`18.173513986974054"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.002869273608044871056`18.15674196798752"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0026738065157757868065`18.12609998161833"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.002109748655814102508`18.32423071885459"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.003477787568094586543`18.541303050690868}, {
                    Style["75%", Bold], 
                    0.0029822495562783681715`18.173513986974054}, {
                    Style["median", Bold], 
                    0.002869273608044871056`18.15674196798752}, {
                    Style["25%", Bold], 
                    0.0026738065157757868065`18.12609998161833}, {
                    Style["min", Bold], 
                    0.002109748655814102508`18.32423071885459}}, Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{35.5, 0.002215859266819592}, {36.5, 
                    0.002215859266819592}, {36.5, 0.002090222252393158}, {
                    35.5, 0.002090222252393158}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{36.5, 0.002155594117302989}, {35.5, 
                    0.002155594117302989}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{36., 0.002090222252393158}, {36., 
                    0.001963097136566708}}, {{36., 0.002215859266819592}, {
                    36., 0.0023386087635789954`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{36.25, 0.001963097136566708}, {35.75, 
                    0.001963097136566708}}, {{36.25, 
                    0.0023386087635789954`}, {35.75, 
                    0.0023386087635789954`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.002338608763578995439`18.368957572800763"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.002215859266819592173`18.044512178449928"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.002155594117302989197`18.03253699405573"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.002090222252393158326`18.01916247123948"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001963097136566708048`18.292941789580237"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.002338608763578995439`18.368957572800763}, {
                    Style["75%", Bold], 
                    0.002215859266819592173`18.044512178449928}, {
                    Style["median", Bold], 
                    0.002155594117302989197`18.03253699405573}, {
                    Style["25%", Bold], 
                    0.002090222252393158326`18.01916247123948}, {
                    Style["min", Bold], 
                    0.001963097136566708048`18.292941789580237}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{36.5, 0.005015110770377784}, {37.5, 
                    0.005015110770377784}, {37.5, 0.004595673705082763}, {
                    36.5, 0.004595673705082763}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{37.5, 0.004775257687426875}, {36.5, 
                    0.004775257687426875}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{37., 0.004595673705082763}, {37., 
                    0.003765721835297421}}, {{37., 0.005015110770377784}, {
                    37., 0.005934827470320087}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{37.25, 0.003765721835297421}, {36.75, 
                    0.003765721835297421}}, {{37.25, 0.005934827470320087}, {
                    36.75, 0.005934827470320087}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.005934827470320086854`18.773408098222866"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0050151107703777838415`18.39925053420144"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0047752576874268747375`18.377966816739118"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0045956737050827627805`18.361319190341696"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.003765721835297421161`18.575848236589547"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.005934827470320086854`18.773408098222866}, {
                    Style["75%", Bold], 
                    0.0050151107703777838415`18.39925053420144}, {
                    Style["median", Bold], 
                    0.0047752576874268747375`18.377966816739118}, {
                    Style["25%", Bold], 
                    0.0045956737050827627805`18.361319190341696}, {
                    Style["min", Bold], 
                    0.003765721835297421161`18.575848236589547}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{37.5, 0.002922608475936382}, {38.5, 
                    0.002922608475936382}, {38.5, 0.002719423394858218}, {
                    37.5, 0.002719423394858218}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{38.5, 0.0028108114986212292`}, {37.5, 
                    0.0028108114986212292`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{38., 0.002719423394858218}, {38., 
                    0.002495254821448613}}, {{38., 0.002922608475936382}, {
                    38., 0.003383862691339075}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{38.25, 0.002495254821448613}, {37.75, 
                    0.002495254821448613}}, {{38.25, 0.003383862691339075}, {
                    37.75, 0.003383862691339075}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.003383862691339075031`18.529412732143697"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.002922608475936382035`18.164740643802503"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0028108114986212292405`18.147801725840424"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0027194233948582180635`18.1334468337461"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.002495254821448612825`18.39711490342554"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.003383862691339075031`18.529412732143697}, {
                    Style["75%", Bold], 
                    0.002922608475936382035`18.164740643802503}, {
                    Style["median", Bold], 
                    0.0028108114986212292405`18.147801725840424}, {
                    Style["25%", Bold], 
                    0.0027194233948582180635`18.1334468337461}, {
                    Style["min", Bold], 
                    0.002495254821448612825`18.39711490342554}}, Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}}, {}, {}}}, {{{{{{{{{{}, {}}, {}}, \
{{{}, {}}, {}}}, {}}, {}}, {}}}, {{{{{{{{}, {}}, {}}, {{{}, {}}, {}}}, {}}, \
{}}, {}}}, {{{{{{{{}, {}}, {}}, {{{}, {}}, {}}}, {}}, {}}, {}}}, {{{{{{{{}, \
{}}, {}}, {{{}, {}}, {}}}, {}}, {}}, {}}}, {{{{{{{{}, {}}, {}}, {{{}, {}}, \
{}}}, {}}, {}}, {}}}, {{{{{{{{}, {}}, {}}, {{{}, {}}, {}}}, {}}, {}}, {}}}, \
{{{{{{{{}, {}}, {}}, {{{}, {}}, {}}}, {}}, {}}, {}}}, {{{{{{{{}, {}}, {}}, \
{{{}, {}}, {}}}, {}}, {}}, {}}}, {{{{{{{{}, {}}, {}}, {{{}, {}}, {}}}, {}}, \
{}}, {}}}, {{{{{{{{}, {}}, {}}, {{{}, {}}, {}}}, {}}, {}}, {}}}, {{{{{{{{}, \
{}}, {}}, {{{}, {}}, {}}}, {}}, {}}, {}}}, {{{{{{{{}, {}}, {}}, {{{}, {}}, \
{}}}, {}}, {}}, {}}}, {{{{{{{{}, {}}, {}}, {{{}, {}}, {}}}, {}}, {}}, {}}}, \
{{{{{{{{}, {}}, {}}, {{{}, {}}, {}}}, {}}, {}}, {}}}, {{{{{{{{}, {}}, {}}, \
{{{}, {}}, {}}}, {}}, {}}, {}}}, {{{{{{{{}, {}}, {}}, {{{}, {}}, {}}}, {}}, \
{}}, {}}}, {{{{{{{{}, {}}, {}}, {{{}, {}}, {}}}, {}}, {}}, {}}}, {{{{{{{{}, \
{}}, {}}, {{{}, {}}, {}}}, {}}, {}}, {}}}, {{{{{{{{}, {}}, {}}, {{{}, {}}, \
{}}}, {}}, {}}, {}}}}, {}}, {}}, {{}, {{{
         Directive[
          PointSize[0.012833333333333334`], 
          AbsoluteThickness[1.6], 
          GrayLevel[0]], 
         GeometricTransformationBox[
          InsetBox[
           BoxData[
            FormBox[
             StyleBox[
              GraphicsBox[{
                EdgeForm[], 
                DiskBox[{0, 0}]}], 
              GraphicsBoxOptions -> {DefaultBaseStyle -> Directive[
                  PointSize[0.012833333333333334`], 
                  AbsoluteThickness[1.6], 
                  GrayLevel[0]]}, StripOnInput -> False], TraditionalForm]], {
           0., 0.}, Automatic, 
           Offset[7]], CompressedData["
1:eJxTTMoPSmVmYGAQBmJGIGZigAOHwI2fIysehttDuAIOLFLtUu5zYqF8CQfz
qCk7nvXHQfkKDte1fzuH50ZB+SoOCvsbtfifx0P5Gg42RenPlnyKhvJ1HFzf
aL+2y4PxDRzWC6k9z/ieBOUbOXQJn3x3tiQGyjdxeHZeM9pYIgHKN3MoPair
1DMPJm/hcH6vLfvkLTC+lUOk/69ncdIw+20c5E/fCZDvgfHtHJo3rZtuEwBz
r4PDpf0PmD6HwPzj6PDQIE8pZSHMv04Ox/XCZ4skJkL5zg7LpKdzRjGm2QMA
OtZMjg==
          "]]}}}, {{}, {}}}, {{}, {{{
         Directive[
          PointSize[0.012833333333333334`], 
          AbsoluteThickness[1.6], 
          GrayLevel[0]], 
         GeometricTransformationBox[
          InsetBox[
           BoxData[
            FormBox[
             StyleBox[
              GraphicsBox[{
                EdgeForm[], 
                DiskBox[{0, 0}]}], 
              GraphicsBoxOptions -> {DefaultBaseStyle -> Directive[
                  PointSize[0.012833333333333334`], 
                  AbsoluteThickness[1.6], 
                  GrayLevel[0]]}, StripOnInput -> False], TraditionalForm]], {
           0., 0.}, Automatic, 
           Offset[7]], CompressedData["
1:eJxTTMoPSmVmYGAQBmJGIGZigIEP9hmP17CZhybbQ/gcDkeOXzH0EsyB8kUc
al5t/XiBJRfKl3EQr9zP/aggCcpXcljvFRWTkJkJ5as5rNq2wSPENQ3K13IQ
Wny2ga8qFcrXc2Db51htJ5gP5Rs6bNMzuny+Cma+sYNaVFnGfeMCKN/UIfSW
X430PZh55g6nfKqzN0TA1Fs6pC6b5HBIrQjKt3Y43Pjk0bkomH5bBw3HL5at
PolQvr3DLaWzc9LVofY3ODgsPnFf25IhA8p3dGDpSmVxUIS6t8HJwZxlieXh
O0X2AEIpTUQ=
          "]]}}}, {{}, {}}}}, {
    ImageSize -> 1000, 
     GridLines -> {{0.5, 2.5, 4.5, 6.5, 8.5, 10.5, 12.5, 14.5, 16.5, 18.5, 
       20.5, 22.5, 24.5, 26.5, 28.5, 30.5, 32.5, 34.5, 36.5, 38.5}, {0}}, 
     GridLinesStyle -> {
       Directive[
        Thickness[Large], 
        RGBColor[
        0.7777777777777778, 0.7777777777777778, 0.7777777777777778]], {
        GrayLevel[1]}}, DisplayFunction -> Identity, AspectRatio -> 0.375, 
     Axes -> {False, False}, AxesLabel -> {None, None}, 
     AxesOrigin -> {-1.4000000000000001`, 0.00013718472605059144`}, Frame -> 
     True, FrameLabel -> {{None, None}, {None, None}}, FrameStyle -> 
     Directive[12, Bold, 
       Thickness[Large], 
       RGBColor[
       0.33333333333333337`, 0.33333333333333337`, 0.33333333333333337`]], 
     FrameTicks -> {{Automatic, Automatic}, {{{1.5, 
          FormBox["\"1\"", TraditionalForm], {0, 0}}, {3.5, 
          FormBox["\"2\"", TraditionalForm], {0, 0}}, {5.5, 
          FormBox["\"3\"", TraditionalForm], {0, 0}}, {7.5, 
          FormBox["\"4\"", TraditionalForm], {0, 0}}, {9.5, 
          FormBox["\"5\"", TraditionalForm], {0, 0}}, {11.5, 
          FormBox["\"6\"", TraditionalForm], {0, 0}}, {13.5, 
          FormBox["\"7\"", TraditionalForm], {0, 0}}, {15.5, 
          FormBox["\"8\"", TraditionalForm], {0, 0}}, {17.5, 
          FormBox["\"9\"", TraditionalForm], {0, 0}}, {19.5, 
          FormBox["\"10\"", TraditionalForm], {0, 0}}, {21.5, 
          FormBox["\"11\"", TraditionalForm], {0, 0}}, {23.5, 
          FormBox["\"12\"", TraditionalForm], {0, 0}}, {25.5, 
          FormBox["\"13\"", TraditionalForm], {0, 0}}, {27.5, 
          FormBox["\"14\"", TraditionalForm], {0, 0}}, {29.5, 
          FormBox["\"15\"", TraditionalForm], {0, 0}}, {31.5, 
          FormBox["\"16\"", TraditionalForm], {0, 0}}, {33.5, 
          FormBox["\"17\"", TraditionalForm], {0, 0}}, {35.5, 
          FormBox["\"18\"", TraditionalForm], {0, 0}}, {37.5, 
          FormBox["\"19\"", TraditionalForm], {0, 0}}}, {}}}, GridLinesStyle -> 
     Directive[
       GrayLevel[0.5, 0.4]], ImageSize -> Large, LabelStyle -> 
     Directive[12, Bold, 
       Thickness[Large]], PlotRange -> {{2, 37}, {0, All}}, 
     PlotRangePadding -> {{
        Scaled[0.05], 
        Scaled[0.05]}, {
        Scaled[0.05], 
        Scaled[0.05]}}, Ticks -> {{{1.5, 
         FormBox["\"1\"", TraditionalForm], {0, 0}}, {3.5, 
         FormBox["\"2\"", TraditionalForm], {0, 0}}, {5.5, 
         FormBox["\"3\"", TraditionalForm], {0, 0}}, {7.5, 
         FormBox["\"4\"", TraditionalForm], {0, 0}}, {9.5, 
         FormBox["\"5\"", TraditionalForm], {0, 0}}, {11.5, 
         FormBox["\"6\"", TraditionalForm], {0, 0}}, {13.5, 
         FormBox["\"7\"", TraditionalForm], {0, 0}}, {15.5, 
         FormBox["\"8\"", TraditionalForm], {0, 0}}, {17.5, 
         FormBox["\"9\"", TraditionalForm], {0, 0}}, {19.5, 
         FormBox["\"10\"", TraditionalForm], {0, 0}}, {21.5, 
         FormBox["\"11\"", TraditionalForm], {0, 0}}, {23.5, 
         FormBox["\"12\"", TraditionalForm], {0, 0}}, {25.5, 
         FormBox["\"13\"", TraditionalForm], {0, 0}}, {27.5, 
         FormBox["\"14\"", TraditionalForm], {0, 0}}, {29.5, 
         FormBox["\"15\"", TraditionalForm], {0, 0}}, {31.5, 
         FormBox["\"16\"", TraditionalForm], {0, 0}}, {33.5, 
         FormBox["\"17\"", TraditionalForm], {0, 0}}, {35.5, 
         FormBox["\"18\"", TraditionalForm], {0, 0}}, {37.5, 
         FormBox["\"19\"", TraditionalForm], {0, 0}}}, None}}], 
   FormBox[
    FormBox[
     TemplateBox[{"\"GC rate\"", "\"CO rate\""}, "SwatchLegend", 
      DisplayFunction -> (FormBox[
        StyleBox[
         StyleBox[
          PaneBox[
           TagBox[
            GridBox[{{
               TagBox[
                GridBox[{{
                   GraphicsBox[{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.5], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0.982864, 0.7431472, 0.3262672]], 
                    RectangleBox[{0, 0}, {10, 10}, "RoundingRadius" -> 0]}, 
                    AspectRatio -> Full, ImageSize -> {10, 10}, 
                    PlotRangePadding -> None, ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #}, {
                   GraphicsBox[{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.5], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0.4992, 0.5552, 0.8309304]], 
                    RectangleBox[{0, 0}, {10, 10}, "RoundingRadius" -> 0]}, 
                    AspectRatio -> Full, ImageSize -> {10, 10}, 
                    PlotRangePadding -> None, ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #2}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
                 AutoDelete -> False, 
                 GridBoxDividers -> {
                  "Columns" -> {{False}}, "Rows" -> {{False}}}, 
                 GridBoxItemSize -> {"Columns" -> {{All}}, "Rows" -> {{All}}},
                  GridBoxSpacings -> {
                  "Columns" -> {{0.3}}, "Rows" -> {{0.5}}}], "Grid"]}}, 
             GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
             AutoDelete -> False, 
             GridBoxItemSize -> {
              "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
             GridBoxSpacings -> {"Columns" -> {{1}}, "Rows" -> {{0}}}], 
            "Grid"], Alignment -> Left, AppearanceElements -> None, 
           ImageMargins -> {{5, 5}, {5, 5}}, ImageSizeAction -> 
           "ResizeToFit"], LineIndent -> 0, StripOnInput -> False], {
          Directive[12, Bold, 
           Thickness[Large]], FontFamily -> "Arial"}, Background -> Automatic,
          StripOnInput -> False], TraditionalForm]& ), 
      InterpretationFunction :> (RowBox[{"SwatchLegend", "[", 
         RowBox[{
           RowBox[{"{", 
             RowBox[{
               RowBox[{"{", 
                 RowBox[{
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}]}], "}"}], ",", 
               RowBox[{"{", 
                 RowBox[{
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0.982864, 0.7431472, 0.3262672], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> 
                    RGBColor[
                    0.6552426666666666, 0.4954314666666667, 
                    0.21751146666666665`], FrameTicks -> None, 
                    PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"RGBColor", "[", 
                    
                    RowBox[{"0.982864`", ",", "0.7431472`", ",", 
                    "0.3262672`"}], "]"}], NumberMarks -> False]], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0.982864, 0.7431472, 0.3262672]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0.982864, 0.7431472, 0.3262672], Editable -> 
                    False, Selectable -> False], "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0.4992, 0.5552, 0.8309304], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> 
                    RGBColor[0.3328, 0.37013333333333337`, 0.5539536], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"RGBColor", "[", 
                    RowBox[{"0.4992`", ",", "0.5552`", ",", "0.8309304`"}], 
                    "]"}], NumberMarks -> False]], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0.4992, 0.5552, 0.8309304]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0.4992, 0.5552, 0.8309304], Editable -> False, 
                    Selectable -> False], "]"}]}], "}"}]}], "}"}], ",", 
           RowBox[{"{", 
             RowBox[{
               RowBox[{"{", "}"}], ",", 
               RowBox[{"{", 
                 RowBox[{#, ",", #2}], "}"}]}], "}"}], ",", 
           RowBox[{"LegendMarkers", "\[Rule]", 
             RowBox[{"{", 
               RowBox[{
                 RowBox[{"{", "None", "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"Automatic", ",", "Automatic"}], "}"}]}], "}"}]}], 
           ",", 
           RowBox[{"LabelStyle", "\[Rule]", 
             RowBox[{"Directive", "[", 
               RowBox[{"12", ",", "Bold", ",", 
                 RowBox[{"Thickness", "[", "Large", "]"}]}], "]"}]}], ",", 
           RowBox[{"LegendLayout", "\[Rule]", "\"Column\""}]}], "]"}]& ), 
      Editable -> True], TraditionalForm], TraditionalForm]},
  "Legended",
  DisplayFunction->(GridBox[{{
      TagBox[
       ItemBox[
        PaneBox[
         TagBox[#, "SkipImageSizeLevel"], Alignment -> {Center, Baseline}, 
         BaselinePosition -> Baseline], DefaultBaseStyle -> "Labeled"], 
       "SkipImageSizeLevel"], 
      ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
    GridBoxAlignment -> {"Columns" -> {{Center}}, "Rows" -> {{Center}}}, 
    AutoDelete -> False, GridBoxItemSize -> Automatic, 
    BaselinePosition -> {1, 1}]& ),
  Editable->True,
  InterpretationFunction->(RowBox[{"Legended", "[", 
     RowBox[{#, ",", 
       RowBox[{"Placed", "[", 
         RowBox[{#2, ",", "After"}], "]"}]}], "]"}]& )]], "Output",
 CellChangeTimes->{3.8442516374828568`*^9, 3.844307743107291*^9, 
  3.8443077938997097`*^9},
 CellLabel->
  "Out[268]=",ExpressionUUID->"66e50791-445a-4d0a-a5f9-254f640aec2f"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"pooledLplot", " ", "=", " ", 
  RowBox[{"Show", "[", "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"BoxWhiskerChart", "[", 
     RowBox[{"LsPooled", ",", 
      RowBox[{"BarOrigin", "\[Rule]", "Bottom"}], ",", "\[IndentingNewLine]", 
      
      RowBox[{"LabelStyle", "\[Rule]", 
       RowBox[{"Directive", "[", 
        RowBox[{"12", ",", "Bold", ",", "Thick"}], "]"}]}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"Frame", "\[Rule]", "True"}], ",", 
      RowBox[{"FrameStyle", "\[Rule]", 
       RowBox[{"Directive", "[", 
        RowBox[{"12", ",", "Bold", ",", "Thick", ",", 
         RowBox[{"Darker", "@", "Gray"}]}], "]"}]}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"FrameLabel", "\[Rule]", 
       RowBox[{"{", 
        RowBox[{"\"\<tract length\>\"", ",", "\"\<\>\""}], "}"}]}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"ImageSize", "\[Rule]", "Medium"}], ",", 
      RowBox[{"PlotRange", "\[Rule]", "All"}], ",", "\[IndentingNewLine]", 
      RowBox[{"AspectRatio", "\[Rule]", 
       RowBox[{
        RowBox[{"9", "/", "16"}], "/", 
        RowBox[{"(", "1.5", ")"}]}]}]}], "]"}], ",", "\[IndentingNewLine]", 
    RowBox[{"ListPlot", "[", 
     RowBox[{"truthLs", ",", 
      RowBox[{"PlotStyle", "\[Rule]", "Black"}], ",", 
      RowBox[{"PlotMarkers", "\[Rule]", 
       RowBox[{"{", 
        RowBox[{"Automatic", ",", "Small"}], "}"}]}]}], "]"}], ",", 
    "\[IndentingNewLine]", 
    RowBox[{"ImageSize", "\[Rule]", "1000"}], ",", "\[IndentingNewLine]", 
    RowBox[{"PlotRange", "\[Rule]", 
     RowBox[{"{", 
      RowBox[{"All", ",", 
       RowBox[{"{", 
        RowBox[{"80", ",", "130"}], "}"}]}], "}"}]}]}], "\[IndentingNewLine]",
    "]"}]}]], "Input",
 CellChangeTimes->{{3.844251527659902*^9, 3.8442518994162683`*^9}, {
  3.844307466472567*^9, 3.844307547819682*^9}, {3.844307748217986*^9, 
  3.844307749947348*^9}, {3.844307855914823*^9, 3.844307858346542*^9}, {
  3.844308014787271*^9, 3.84430807453948*^9}},
 CellLabel->
  "In[278]:=",ExpressionUUID->"eca21f38-8e30-47e7-90cd-31d9e2dd6173"],

Cell[BoxData[
 GraphicsBox[{{
    {Opacity[0], 
     PointBox[{{-0.19605693430634064`, 88.40184064198067}, {
      2.1960569343063403`, 130.38596665055795`}}]}, 
    {RGBColor[0.982864, 0.7431472, 0.3262672], CapForm[None], {}, 
     {RGBColor[0.982864, 0.7431472, 0.3262672], 
      {RGBColor[0.982864, 0.7431472, 0.3262672], 
       TagBox[
        TooltipBox[
         TagBox[
          DynamicBox[{
            FEPrivate`If[
             CurrentValue["MouseOver"], 
             EdgeForm[{
               GrayLevel[0.5], 
               AbsoluteThickness[1.5], 
               Opacity[0.66]}], {}, {}], 
            GraphicsGroupBox[{Antialiasing -> False, 
              
              PolygonBox[{{0.8039430656936596, 106.83473222544647`}, {
               1.1960569343063403`, 106.83473222544647`}, {
               1.1960569343063403`, 101.94857470050769`}, {0.8039430656936596,
                101.94857470050769`}}], {}, {{}, {}}, {}, {
               GrayLevel[0], 
               GrayLevel[1], 
               
               LineBox[{{1.1960569343063403`, 104.04804342136208`}, {
                0.8039430656936597, 104.04804342136208`}}]}, {}, {
               GrayLevel[0], 
               GrayLevel[0.5], 
               
               LineBox[{{{1., 101.94857470050769`}, {1., 
                90.31021000600691}}, {{1., 106.83473222544647`}, {1., 
                128.4775972865317}}}]}, {
               GrayLevel[0], 
               GrayLevel[0.5], 
               
               LineBox[{{{1.0980284671531702`, 90.31021000600691}, {
                0.9019715328468298, 90.31021000600691}}, {{
                1.0980284671531702`, 128.4775972865317}, {0.9019715328468298, 
                128.4775972865317}}}]}, {}}]},
           
           ImageSizeCache->{{402.5857864376269, 
            533.4142135623731}, {-149.4142135623731, 76.4142135623731}}],
          "DelayedMouseEffectStyle"],
         StyleBox[
          TagBox[
           GridBox[{{
              StyleBox["\"max\"", Bold, StripOnInput -> False], 
              "128.4775972865317044`18.108827406087173"}, {
              StyleBox["\"75%\"", Bold, StripOnInput -> False], 
              "106.83473222544647285`17.727682470152768"}, {
              StyleBox["\"median\"", Bold, StripOnInput -> False], 
              "104.0480434213620811`17.716203922239792"}, {
              StyleBox["\"25%\"", Bold, StripOnInput -> False], 
              "101.94857470050769165`17.707351162806905"}, {
              StyleBox["\"min\"", Bold, StripOnInput -> False], 
              "90.31021000600691195`18.95573685218071"}}, 
            GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
            AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                Directive[
                 GrayLevel[0.3]], {
                 Directive[
                  GrayLevel[0.3]]}, 
                Directive[
                 GrayLevel[0.3]]}, "Rows" -> {
                Directive[
                 GrayLevel[0.3]], {
                 Directive[
                  GrayLevel[0.3]]}, 
                Directive[
                 GrayLevel[0.3]]}}, 
            GridBoxFrame -> {
             "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}}, 
            GridBoxItemSize -> {
             "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, BaseStyle -> 
            Directive[
              AbsoluteThickness[1], 
              Dashing[{}]]], "Grid"], {
           Directive[12, Bold, 
            Thickness[Large]]}, StripOnInput -> False]],
        Annotation[#, 
         Style[
          Grid[{{
             Style["max", Bold], 128.4775972865317044`18.108827406087173}, {
             Style["75%", Bold], 106.83473222544647285`17.727682470152768}, {
             Style["median", Bold], 104.0480434213620811`17.716203922239792}, {
             Style["25%", Bold], 101.94857470050769165`17.707351162806905}, {
             Style["min", Bold], 90.31021000600691195`18.95573685218071}}, 
           Dividers -> {{
              Directive[
               GrayLevel[0.3]], {
               Directive[
                GrayLevel[0.3]]}, 
              Directive[
               GrayLevel[0.3]]}, {
              Directive[
               GrayLevel[0.3]], {
               Directive[
                GrayLevel[0.3]]}, 
              Directive[
               GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, Frame -> 
           GrayLevel[0], BaseStyle -> Directive[
             AbsoluteThickness[1], 
             Dashing[{}]]], {
           Directive[12, Bold, 
            Thickness[Large]]}], 
         "Tooltip"]& ]}}, {}, {}}, {{{{{{}, {}}, {}}, {}}, {}}, {}}, {}}, {{}, 
    {GrayLevel[0], PointSize[0.012833333333333334`], AbsoluteThickness[1.6], 
     GeometricTransformationBox[InsetBox[
       FormBox[
        StyleBox[
         GraphicsBox[
          {EdgeForm[None], DiskBox[{0, 0}]}],
         StripOnInput->False,
         GraphicsBoxOptions->{DefaultBaseStyle->Directive[
           PointSize[0.012833333333333334`], 
           AbsoluteThickness[1.6], 
           GrayLevel[0]]}],
        TraditionalForm], {0., 0.}, Automatic, Offset[7]], {{{1., 
      108.399686}}, {{1., 108.399686}}}]}, {{}, {}}}},
  AspectRatio->0.375,
  Axes->{False, False},
  AxesLabel->{None, None},
  AxesOrigin->{0.7843373722630256, 88.40184064198067},
  DisplayFunction->Identity,
  Frame->True,
  FrameLabel->{{
     FormBox["\"\"", TraditionalForm], None}, {
     FormBox["\"tract length\"", TraditionalForm], None}},
  FrameStyle->Directive[12, Bold, 
    Thickness[Large], 
    RGBColor[
    0.33333333333333337`, 0.33333333333333337`, 0.33333333333333337`]],
  FrameTicks->{{Automatic, Automatic}, {{{1., 
       FormBox[
        TemplateBox[{0}, "Spacer1"], TraditionalForm], {0.008, 0}}, {
      0.8039430656936596, 
       FormBox[
        TemplateBox[{0}, "Spacer1"], TraditionalForm], {0, 0}}, {
      1.1960569343063403`, 
       FormBox[
        TemplateBox[{0}, "Spacer1"], TraditionalForm], {0, 0}}}, {{1., 
       FormBox[
        TemplateBox[{0}, "Spacer1"], TraditionalForm], {0.008, 0}}, {
      0.8039430656936596, 
       FormBox[
        TemplateBox[{0}, "Spacer1"], TraditionalForm], {0, 0}}, {
      1.1960569343063403`, 
       FormBox[
        TemplateBox[{0}, "Spacer1"], TraditionalForm], {0, 0}}}}},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  ImageSize->1000,
  LabelStyle->Directive[12, Bold, 
    Thickness[Large]],
  PlotRange->{All, {80, 130}},
  PlotRangePadding->{{
     Scaled[0.05], 
     Scaled[0.05]}, {
     Scaled[0.05], 
     Scaled[0.05]}},
  Ticks->{{{1., 
      FormBox[
       TemplateBox[{0}, "Spacer1"], TraditionalForm], {0.008, 0}}, {
     0.8039430656936596, 
      FormBox[
       TemplateBox[{0}, "Spacer1"], TraditionalForm], {0, 0}}, {
     1.1960569343063403`, 
      FormBox[
       TemplateBox[{0}, "Spacer1"], TraditionalForm], {0, 0}}}, 
    Automatic}]], "Output",
 CellChangeTimes->{{3.8443074863145447`*^9, 3.844307548444639*^9}, 
   3.844307751252946*^9, 3.844307860695641*^9, {3.8443080184665413`*^9, 
   3.844308075443516*^9}},
 CellLabel->
  "Out[278]=",ExpressionUUID->"d7132d96-c8bb-4a8d-a827-8ed84c2026f6"]
}, Open  ]],

Cell[BoxData[
 RowBox[{"\[IndentingNewLine]", "\[IndentingNewLine]", "\[IndentingNewLine]", 
  "\[IndentingNewLine]", "\[IndentingNewLine]", 
  "\[IndentingNewLine]"}]], "Input",
 CellChangeTimes->{{3.844307928999528*^9, 
  3.8443079297656393`*^9}},ExpressionUUID->"55a062dc-e8d2-4a13-8fdc-\
c5b4846a1627"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"singleGCandCOplot", " ", "=", " ", 
  RowBox[{"Show", "[", "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"BoxWhiskerChart", "[", "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"MapThread", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"{", 
          RowBox[{"#1", ",", "#2"}], "}"}], "&"}], ",", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"Normal", "@", 
           RowBox[{"Transpose", "[", "gammasSingle", "]"}]}], ",", 
          RowBox[{"Normal", "@", 
           RowBox[{"Transpose", "[", "kappasSingle", "]"}]}]}], "}"}]}], 
       "]"}], ",", "\[IndentingNewLine]", 
      RowBox[{"PlotRange", "\[Rule]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"2", ",", 
           RowBox[{
            RowBox[{"19", "*", "2"}], "-", "1"}]}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"0", ",", "All"}], "}"}]}], "}"}]}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"Ticks", "\[Rule]", "None"}], ",", "\[IndentingNewLine]", 
      RowBox[{"ChartLabels", "\[Rule]", 
       RowBox[{"{", 
        RowBox[{"chrStrings", ",", 
         RowBox[{"{", "None", "}"}]}], "}"}]}], 
      RowBox[{"(*", 
       RowBox[{"ChartLabels", "\[Rule]", 
        RowBox[{"{", 
         RowBox[{"chrStrings", ",", 
          RowBox[{"{", 
           RowBox[{"None", ",", "None", ",", "None", ",", "None"}], "}"}]}], 
         "}"}]}], "*)"}], ",", "\[IndentingNewLine]", 
      RowBox[{"BarSpacing", "\[Rule]", 
       RowBox[{"{", 
        RowBox[{"0", ",", "0"}], "}"}]}], ",", "\[IndentingNewLine]", 
      RowBox[{"AspectRatio", "\[Rule]", 
       RowBox[{
        RowBox[{"9", "/", "16"}], "/", 
        RowBox[{"(", "1.5", ")"}]}]}], ",", "\[IndentingNewLine]", 
      RowBox[{"ChartLegends", "\[Rule]", 
       RowBox[{"{", 
        RowBox[{"\"\<GC rate\>\"", ",", "\"\<CO rate\>\""}], "}"}]}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"LabelStyle", "\[Rule]", 
       RowBox[{"Directive", "[", 
        RowBox[{"12", ",", "Bold", ",", "Thick"}], "]"}]}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"Frame", "\[Rule]", "True"}], ",", 
      RowBox[{"FrameStyle", "\[Rule]", 
       RowBox[{"Directive", "[", 
        RowBox[{"12", ",", "Bold", ",", "Thick", ",", 
         RowBox[{"Darker", "@", "Gray"}]}], "]"}]}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"ImageSize", "\[Rule]", "Large"}]}], "]"}], ",", 
    "\[IndentingNewLine]", 
    RowBox[{"ListPlot", "[", 
     RowBox[{"plotKappas", ",", 
      RowBox[{"PlotMarkers", "\[Rule]", 
       RowBox[{"{", 
        RowBox[{"Automatic", ",", "Small"}], "}"}]}], ",", 
      RowBox[{"PlotStyle", "\[Rule]", "Black"}]}], "]"}], ",", 
    "\[IndentingNewLine]", 
    RowBox[{"ListPlot", "[", 
     RowBox[{"plotGammas", ",", 
      RowBox[{"PlotMarkers", "\[Rule]", 
       RowBox[{"{", 
        RowBox[{"Automatic", ",", "Small"}], "}"}]}], ",", 
      RowBox[{"PlotStyle", "\[Rule]", "Black"}]}], "]"}], ",", 
    "\[IndentingNewLine]", 
    RowBox[{"ImageSize", "\[Rule]", "1000"}], ",", 
    RowBox[{"GridLines", "\[Rule]", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"Range", "[", 
        RowBox[{"0.5", ",", 
         RowBox[{
          RowBox[{"19", "*", "2"}], "+", "0.5"}], ",", "2"}], "]"}], ",", 
       RowBox[{"{", "0", "}"}]}], "}"}]}], ",", 
    RowBox[{"GridLinesStyle", "\[Rule]", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"Directive", "[", 
        RowBox[{"Thick", ",", 
         RowBox[{"Lighter", "@", 
          RowBox[{"Lighter", "@", "Gray"}]}]}], "]"}], ",", 
       RowBox[{"{", "White", "}"}]}], "}"}]}]}], "\[IndentingNewLine]", 
   "]"}]}]], "Input",
 CellChangeTimes->{{3.844243616741766*^9, 3.8442436494674063`*^9}, {
   3.844243783218156*^9, 3.844243790058847*^9}, 3.844243830017737*^9, {
   3.844243910302265*^9, 3.844243940499236*^9}, {3.844244029307844*^9, 
   3.844244029642784*^9}, {3.844244232029031*^9, 3.84424423585327*^9}, {
   3.8442443310334682`*^9, 3.8442443500754147`*^9}, {3.844244453169506*^9, 
   3.844244529595695*^9}, {3.844244580786574*^9, 3.844244602229618*^9}, {
   3.844244633346999*^9, 3.844244636898587*^9}, {3.844247100379238*^9, 
   3.844247155737236*^9}, {3.844247417853837*^9, 3.844247424622587*^9}, {
   3.844247508627604*^9, 3.844247646263489*^9}, {3.8442476809405193`*^9, 
   3.844247785451784*^9}, {3.8442478254337063`*^9, 3.8442478418378067`*^9}, {
   3.844247926937436*^9, 3.8442479413233337`*^9}, {3.84424797922554*^9, 
   3.8442479801930647`*^9}, {3.844248117942176*^9, 3.844248157227189*^9}, {
   3.8442482328799887`*^9, 3.844248233223262*^9}, {3.844248266732719*^9, 
   3.8442483123550167`*^9}, {3.8442483585112247`*^9, 3.84424841592831*^9}, {
   3.8442485499717627`*^9, 3.844248623769928*^9}, {3.844248665107697*^9, 
   3.844248667097089*^9}, {3.844248751362125*^9, 3.844248777461934*^9}, {
   3.844248837034648*^9, 3.844248864637895*^9}, {3.8442490519517937`*^9, 
   3.844249074611058*^9}, {3.844249107737136*^9, 3.8442491276681356`*^9}, {
   3.844249162818617*^9, 3.844249207281906*^9}, {3.844249333287755*^9, 
   3.844249354651156*^9}, {3.844249395635714*^9, 3.8442494043483973`*^9}, {
   3.8442494539649363`*^9, 3.844249457492577*^9}, {3.844249563560442*^9, 
   3.844249581857334*^9}, {3.844249629546159*^9, 3.844249631586163*^9}, {
   3.844249685699497*^9, 3.8442498193369017`*^9}, {3.8442498630571632`*^9, 
   3.844250043438158*^9}, {3.84425007554845*^9, 3.844250101743532*^9}, {
   3.844250286374707*^9, 3.844250302835019*^9}, {3.844250359786124*^9, 
   3.844250362675643*^9}, {3.8442503968653603`*^9, 3.844250454657114*^9}, {
   3.84425049762409*^9, 3.844250616947534*^9}, {3.844250697864221*^9, 
   3.84425069816825*^9}, {3.844250743831031*^9, 3.84425113538941*^9}, {
   3.8442511856415977`*^9, 3.844251283237122*^9}, {3.844251317547226*^9, 
   3.844251389109948*^9}, {3.8442514791653547`*^9, 3.844251479612804*^9}, {
   3.844307725095766*^9, 3.844307740529133*^9}, {3.8443077797037067`*^9, 
   3.8443077905768023`*^9}, {3.844307950608943*^9, 3.8443079618265553`*^9}},
 CellLabel->
  "In[272]:=",ExpressionUUID->"5f4e2a62-d343-441c-a9ae-2a703afcf53a"],

Cell[BoxData[
 TemplateBox[{
   GraphicsBox[{{{
       CapForm[None], 
       Directive[
        RGBColor[0.982864, 0.7431472, 0.3262672]], {{}, {{{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{0.5, 0.0028829703381322096`}, {1.5, 
                    0.0028829703381322096`}, {1.5, 0.0024469533266977986`}, {
                    0.5, 0.0024469533266977986`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{1.5, 0.0027245719936911917`}, {0.5, 
                    0.0027245719936911917`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{1., 0.0024469533266977986`}, {1., 
                    0.00010611883981029728`}}, {{1., 
                    0.0028829703381322096`}, {1., 
                    0.0036726874635776728`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{1.25, 0.00010611883981029728`}, {0.75, 
                    0.00010611883981029728`}}, {{1.25, 
                    0.0036726874635776728`}, {0.75, 
                    0.0036726874635776728`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.003672687463577672777`18.564983972554742"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0028829703381322096225`18.158810178444043"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0027245719936911916815`18.134268292461527"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0024469533266977985635`18.087595690013547"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.0001061188398102972752`18.02579249322567"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.003672687463577672777`18.564983972554742}, {
                    Style["75%", Bold], 
                    0.0028829703381322096225`18.158810178444043}, {
                    Style["median", Bold], 
                    0.0027245719936911916815`18.134268292461527}, {
                    Style["25%", Bold], 
                    0.0024469533266977985635`18.087595690013547}, {
                    Style["min", Bold], 
                    0.0001061188398102972752`18.02579249322567}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{1.5, 0.0015334053639691027`}, {2.5, 
                    0.0015334053639691027`}, {2.5, 0.0014211174278378005`}, {
                    1.5, 0.0014211174278378005`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{2.5, 0.0014826431022449175`}, {1.5, 
                    0.0014826431022449175`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{2., 0.0014211174278378005`}, {2., 
                    0.00038481415441409916`}}, {{2., 
                    0.0015334053639691027`}, {2., 
                    0.0016779829439615632`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{2.25, 0.00038481415441409916`}, {1.75, 
                    0.00038481415441409916`}}, {{2.25, 
                    0.0016779829439615632`}, {1.75, 
                    0.0016779829439615632`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.001677982943961563167`18.224787542082062"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0015334053639691028495`17.884626982454165"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0014826431022449174625`17.870006625776018"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.001421117427837800514`17.85159996977574"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.0003848141544140991615`18.585251038082205"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.001677982943961563167`18.224787542082062}, {
                    Style["75%", Bold], 
                    0.0015334053639691028495`17.884626982454165}, {
                    Style["median", Bold], 
                    0.0014826431022449174625`17.870006625776018}, {
                    Style["25%", Bold], 
                    0.001421117427837800514`17.85159996977574}, {
                    Style["min", Bold], 
                    0.0003848141544140991615`18.585251038082205}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{2.5, 0.0039258527907717325`}, {3.5, 
                    0.0039258527907717325`}, {3.5, 0.0035270161364226857`}, {
                    2.5, 0.0035270161364226857`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{3.5, 0.0036843107790463622`}, {2.5, 
                    0.0036843107790463622`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{3., 0.0035270161364226857`}, {3., 
                    0.0025872781635140276`}}, {{3., 0.0039258527907717325`}, {
                    3., 0.004591095378359667}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{3.25, 0.0025872781635140276`}, {2.75, 
                    0.0025872781635140276`}}, {{3.25, 0.004591095378359667}, {
                    2.75, 0.004591095378359667}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.00459109537835966728`18.661916315171823"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0039258527907717324575`18.2929040149963"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.003684310779046362245`18.265326261021603"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0035270161364226856535`18.246377450945186"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.002587278163514027552`18.412843123105795"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.00459109537835966728`18.661916315171823}, {
                    Style["75%", Bold], 
                    0.0039258527907717324575`18.2929040149963}, {
                    Style["median", Bold], 
                    0.003684310779046362245`18.265326261021603}, {
                    Style["25%", Bold], 
                    0.0035270161364226856535`18.246377450945186}, {
                    Style["min", Bold], 
                    0.002587278163514027552`18.412843123105795}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{3.5, 0.0019573201998715813`}, {4.5, 
                    0.0019573201998715813`}, {4.5, 0.0018021608682140461`}, {
                    3.5, 0.0018021608682140461`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{4.5, 0.0018698011582756698`}, {3.5, 
                    0.0018698011582756698`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{4., 0.0018021608682140461`}, {4., 
                    0.0015888067975008365`}}, {{4., 0.0019573201998715813`}, {
                    4., 0.002298758494789563}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{4.25, 0.0015888067975008365`}, {3.75, 
                    0.0015888067975008365`}}, {{4.25, 0.002298758494789563}, {
                    3.75, 0.002298758494789563}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.002298758494789563192`18.361493347132885"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0019573201998715813315`17.990631882452963"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0018698011582756699505`17.970765428810918"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0018021608682140461465`17.95476355960248"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001588806797500836535`18.20107108922708"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.002298758494789563192`18.361493347132885}, {
                    Style["75%", Bold], 
                    0.0019573201998715813315`17.990631882452963}, {
                    Style["median", Bold], 
                    0.0018698011582756699505`17.970765428810918}, {
                    Style["25%", Bold], 
                    0.0018021608682140461465`17.95476355960248}, {
                    Style["min", Bold], 
                    0.001588806797500836535`18.20107108922708}}, Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{4.5, 0.003908845982911744}, {5.5, 
                    0.003908845982911744}, {5.5, 0.0033741050553160365`}, {
                    4.5, 0.0033741050553160365`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{5.5, 0.003630420305386083}, {4.5, 
                    0.003630420305386083}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{5., 0.0033741050553160365`}, {5., 
                    0.002844207265306959}}, {{5., 0.003908845982911744}, {5., 
                    0.0047183900662802584`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{5.25, 0.002844207265306959}, {4.75, 
                    0.002844207265306959}}, {{5.25, 0.0047183900662802584`}, {
                    4.75, 0.0047183900662802584`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.004718390066280258449`18.67379384087994"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0039088459829117439515`18.291018562952118"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.003630420305386083046`18.25892691194598"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0033741050553160365465`18.227128604887216"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.002844207265306959199`18.45396124145971"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.004718390066280258449`18.67379384087994}, {
                    Style["75%", Bold], 
                    0.0039088459829117439515`18.291018562952118}, {
                    Style["median", Bold], 
                    0.003630420305386083046`18.25892691194598}, {
                    Style["25%", Bold], 
                    0.0033741050553160365465`18.227128604887216}, {
                    Style["min", Bold], 
                    0.002844207265306959199`18.45396124145971}}, Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{5.5, 0.0020811245333989302`}, {6.5, 
                    0.0020811245333989302`}, {6.5, 0.00186994762233747}, {5.5,
                     0.00186994762233747}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{6.5, 0.001996891861771238}, {5.5, 
                    0.001996891861771238}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{6., 0.00186994762233747}, {6., 
                    0.001638239883796571}}, {{6., 0.0020811245333989302`}, {
                    6., 0.0024863280106334875`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{6.25, 0.001638239883796571}, {5.75, 
                    0.001638239883796571}}, {{6.25, 0.0024863280106334875`}, {
                    5.75, 0.0024863280106334875`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.002486328010633487469`18.39555842270108"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.002081124533398930011`18.017268073278906"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0019968918617712379075`17.999324551376162"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.001869947622337470028`17.97079944635466"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001638239883796570968`18.214377494848907"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.002486328010633487469`18.39555842270108}, {
                    Style["75%", Bold], 
                    0.002081124533398930011`18.017268073278906}, {
                    Style["median", Bold], 
                    0.0019968918617712379075`17.999324551376162}, {
                    Style["25%", Bold], 
                    0.001869947622337470028`17.97079944635466}, {
                    Style["min", Bold], 
                    0.001638239883796570968`18.214377494848907}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{6.5, 0.002912818277851608}, {7.5, 
                    0.002912818277851608}, {7.5, 0.0025035875157671584`}, {
                    6.5, 0.0025035875157671584`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{7.5, 0.002724265987673798}, {6.5, 
                    0.002724265987673798}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{7., 0.0025035875157671584`}, {7., 
                    0.0008298799628613613}}, {{7., 0.002912818277851608}, {7.,
                     0.0036060796010590566`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{7.25, 0.0008298799628613613}, {6.75, 
                    0.0008298799628613613}}, {{7.25, 
                    0.0036060796010590566`}, {6.75, 
                    0.0036060796010590566`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.003606079601059056575`18.55703530916374"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0029128182778516075685`18.16328339545594"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.002724265987673798019`18.134219512620625"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.002503587515767158409`18.09753278159699"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.0008298799628613613352`18.919015278837517"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.003606079601059056575`18.55703530916374}, {
                    Style["75%", Bold], 
                    0.0029128182778516075685`18.16328339545594}, {
                    Style["median", Bold], 
                    0.002724265987673798019`18.134219512620625}, {
                    Style["25%", Bold], 
                    0.002503587515767158409`18.09753278159699}, {
                    Style["min", Bold], 
                    0.0008298799628613613352`18.919015278837517}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{7.5, 0.0016824639948791503`}, {8.5, 
                    0.0016824639948791503`}, {8.5, 0.0015236993392447936`}, {
                    7.5, 0.0015236993392447936`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{8.5, 0.0016159334831396333`}, {7.5, 
                    0.0016159334831396333`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{8., 0.0015236993392447936`}, {8., 
                    0.0011138308548288983`}}, {{8., 0.0016824639948791503`}, {
                    8., 0.0019226559370739502`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{8.25, 0.0011138308548288983`}, {7.75, 
                    0.0011138308548288983`}}, {{8.25, 
                    0.0019226559370739502`}, {7.75, 
                    0.0019226559370739502`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.00192265593707395023`18.283901573370397"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0016824639948791502355`17.924915783328544"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.001615933483139633288`17.90739348422758"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.001523699339244793602`17.881869283551666"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.00111383085482889832`18.04681924434592"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.00192265593707395023`18.283901573370397}, {
                    Style["75%", Bold], 
                    0.0016824639948791502355`17.924915783328544}, {
                    Style["median", Bold], 
                    0.001615933483139633288`17.90739348422758}, {
                    Style["25%", Bold], 
                    0.001523699339244793602`17.881869283551666}, {
                    Style["min", Bold], 
                    0.00111383085482889832`18.04681924434592}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{8.5, 0.0035148643543377297`}, {9.5, 
                    0.0035148643543377297`}, {9.5, 0.003057057936488809}, {
                    8.5, 0.003057057936488809}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{9.5, 0.003322528445465742}, {8.5, 
                    0.003322528445465742}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{9., 0.003057057936488809}, {9., 
                    0.0016330978364190577`}}, {{9., 0.0035148643543377297`}, {
                    9., 0.004011729139333316}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{9.25, 0.0016330978364190577`}, {8.75, 
                    0.0016330978364190577`}}, {{9.25, 0.004011729139333316}, {
                    8.75, 0.004011729139333316}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.004011729139333316055`18.603331602996448"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.003514864354337729653`18.2448785737205"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0033225284454657419245`18.220438712131653"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0030570579364888089865`18.184273673765073"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001633097836419057734`18.213012203440986"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.004011729139333316055`18.603331602996448}, {
                    Style["75%", Bold], 
                    0.003514864354337729653`18.2448785737205}, {
                    Style["median", Bold], 
                    0.0033225284454657419245`18.220438712131653}, {
                    Style["25%", Bold], 
                    0.0030570579364888089865`18.184273673765073}, {
                    Style["min", Bold], 
                    0.001633097836419057734`18.213012203440986}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{9.5, 0.002126652236752681}, {10.5, 
                    0.002126652236752681}, {10.5, 0.001962594809775979}, {9.5,
                     0.001962594809775979}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{10.5, 0.002043567308355825}, {9.5, 
                    0.002043567308355825}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{10., 0.001962594809775979}, {10., 
                    0.0014071345785227794`}}, {{10., 0.002126652236752681}, {
                    10., 0.0023598295068331583`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{10.25, 0.0014071345785227794`}, {9.75, 
                    0.0014071345785227794`}}, {{10.25, 
                    0.0023598295068331583`}, {9.75, 
                    0.0023598295068331583`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.002359829506833158261`18.37288062715813"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.002126652236752680971`18.02666648154131"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.002043567308355824855`18.009358950844664"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.001962594809775979141`17.991800650322972"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001407134578522779367`18.148335635398364"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.002359829506833158261`18.37288062715813}, {
                    Style["75%", Bold], 
                    0.002126652236752680971`18.02666648154131}, {
                    Style["median", Bold], 
                    0.002043567308355824855`18.009358950844664}, {
                    Style["25%", Bold], 
                    0.001962594809775979141`17.991800650322972}, {
                    Style["min", Bold], 
                    0.001407134578522779367`18.148335635398364}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{10.5, 0.003225428672449802}, {11.5, 
                    0.003225428672449802}, {11.5, 0.002828792158638551}, {
                    10.5, 0.002828792158638551}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{11.5, 0.0030770404875725935`}, {10.5, 
                    0.0030770404875725935`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{11., 0.002828792158638551}, {11., 
                    0.002346754896941336}}, {{11., 0.003225428672449802}, {
                    11., 0.0036551990719011535`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{11.25, 0.002346754896941336}, {10.75, 
                    0.002346754896941336}}, {{11.25, 
                    0.0036551990719011535`}, {10.75, 
                    0.0036551990719011535`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.003655199071901153469`18.56291103477509"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0032254286724498020235`18.20755744662748"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.003077040487572593264`18.187103215050062"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.002828792158638551192`18.1505710438141"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.002346754896941335815`18.370467732775193"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.003655199071901153469`18.56291103477509}, {
                    Style["75%", Bold], 
                    0.0032254286724498020235`18.20755744662748}, {
                    Style["median", Bold], 
                    0.003077040487572593264`18.187103215050062}, {
                    Style["25%", Bold], 
                    0.002828792158638551192`18.1505710438141}, {
                    Style["min", Bold], 
                    0.002346754896941335815`18.370467732775193}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{11.5, 0.0018143606453710508`}, {12.5, 
                    0.0018143606453710508`}, {12.5, 0.0016773312618994377`}, {
                    11.5, 0.0016773312618994377`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{12.5, 0.001752406900938644}, {11.5, 
                    0.001752406900938644}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{12., 0.0016773312618994377`}, {12., 
                    0.0015300386313880034`}}, {{12., 
                    0.0018143606453710508`}, {12., 0.002105699879649813}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{12.25, 0.0015300386313880034`}, {11.75, 
                    0.0015300386313880034`}}, {{12.25, 
                    0.002105699879649813}, {11.75, 
                    0.002105699879649813}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.002105699879649812999`18.32339647231"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.001814360645371050759`17.957693621529238"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0017524069009386439735`17.942604959087344"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.001677331261899437688`17.923588845718395"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001530038631388003353`18.18470239629919"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.002105699879649812999`18.32339647231}, {
                    Style["75%", Bold], 
                    0.001814360645371050759`17.957693621529238}, {
                    Style["median", Bold], 
                    0.0017524069009386439735`17.942604959087344}, {
                    Style["25%", Bold], 
                    0.001677331261899437688`17.923588845718395}, {
                    Style["min", Bold], 
                    0.001530038631388003353`18.18470239629919}}, Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{12.5, 0.003312659926544994}, {13.5, 
                    0.003312659926544994}, {13.5, 0.0028085150477214285`}, {
                    12.5, 0.0028085150477214285`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{13.5, 0.003090626828821622}, {12.5, 
                    0.003090626828821622}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{13., 0.0028085150477214285`}, {13., 
                    0.0023320976139405143`}}, {{13., 0.003312659926544994}, {
                    13., 0.003747806837394406}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{13.25, 0.0023320976139405143`}, {12.75, 
                    0.0023320976139405143`}}, {{13.25, 
                    0.003747806837394406}, {12.75, 
                    0.003747806837394406}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.003747806837394406215`18.57377719918065"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0033126599265449940735`18.21914685838712"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0030906268288216217585`18.189016574599147"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0028085150477214287315`18.147446759457516"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.002332097613940514302`18.367746724606913"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.003747806837394406215`18.57377719918065}, {
                    Style["75%", Bold], 
                    0.0033126599265449940735`18.21914685838712}, {
                    Style["median", Bold], 
                    0.0030906268288216217585`18.189016574599147}, {
                    Style["25%", Bold], 
                    0.0028085150477214287315`18.147446759457516}, {
                    Style["min", Bold], 
                    0.002332097613940514302`18.367746724606913}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{13.5, 0.0017654125027938676`}, {14.5, 
                    0.0017654125027938676`}, {14.5, 0.0016124008943591407`}, {
                    13.5, 0.0016124008943591407`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{14.5, 0.0016911273994612709`}, {13.5, 
                    0.0016911273994612709`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{14., 0.0016124008943591407`}, {14., 
                    0.0014372912993441183`}}, {{14., 
                    0.0017654125027938676`}, {14., 0.00189700137556254}}}]}, {
                    
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{14.25, 0.0014372912993441183`}, {13.75, 
                    0.0014372912993441183`}}, {{14.25, 0.00189700137556254}, {
                    13.75, 0.00189700137556254}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.00189700137556253999`18.27806764580643"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.001765412502793867579`17.945816202306812"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.001691127399461270762`17.927146330324593"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0016124008943591407275`17.90644303470957"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001437291299344118332`18.15754479658019"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.00189700137556253999`18.27806764580643}, {
                    Style["75%", Bold], 
                    0.001765412502793867579`17.945816202306812}, {
                    Style["median", Bold], 
                    0.001691127399461270762`17.927146330324593}, {
                    Style["25%", Bold], 
                    0.0016124008943591407275`17.90644303470957}, {
                    Style["min", Bold], 
                    0.001437291299344118332`18.15754479658019}}, Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{14.5, 0.004353918435135795}, {15.5, 
                    0.004353918435135795}, {15.5, 0.0038266100589140514`}, {
                    14.5, 0.0038266100589140514`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{15.5, 0.004094394598003734}, {14.5, 
                    0.004094394598003734}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{15., 0.0038266100589140514`}, {15., 
                    0.00289073378756203}}, {{15., 0.004353918435135795}, {15.,
                     0.00519315091531889}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{15.25, 0.00289073378756203}, {14.75, 
                    0.00289073378756203}}, {{15.25, 0.00519315091531889}, {
                    14.75, 0.00519315091531889}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.005193150915318889803`18.71543094357289"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0043539184351357941745`18.337850293188488"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.004094394598003733236`18.311159699887064"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.003826610058914051409`18.281784213126983"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.002890733787562029845`18.461008098617654"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.005193150915318889803`18.71543094357289}, {
                    Style["75%", Bold], 
                    0.0043539184351357941745`18.337850293188488}, {
                    Style["median", Bold], 
                    0.004094394598003733236`18.311159699887064}, {
                    Style["25%", Bold], 
                    0.003826610058914051409`18.281784213126983}, {
                    Style["min", Bold], 
                    0.002890733787562029845`18.461008098617654}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{15.5, 0.0025747572116586745`}, {16.5, 
                    0.0025747572116586745`}, {16.5, 0.0022834820328108602`}, {
                    15.5, 0.0022834820328108602`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{16.5, 0.0024233892827922247`}, {15.5, 
                    0.0024233892827922247`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{16., 0.0022834820328108602`}, {16., 
                    0.00181874264667599}}, {{16., 0.0025747572116586745`}, {
                    16., 0.0029180163137549533`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{16.25, 0.00181874264667599}, {15.75, 
                    0.00181874264667599}}, {{16.25, 0.0029180163137549533`}, {
                    15.75, 0.0029180163137549533`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.002918016313754953281`18.46508771557455"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0025747572116586745285`18.109706287574163"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.002423389282792224502`18.08339318726801"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.002283482032810860455`18.05756760312038"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001818742646675990029`18.259771250445723"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.002918016313754953281`18.46508771557455}, {
                    Style["75%", Bold], 
                    0.0025747572116586745285`18.109706287574163}, {
                    Style["median", Bold], 
                    0.002423389282792224502`18.08339318726801}, {
                    Style["25%", Bold], 
                    0.002283482032810860455`18.05756760312038}, {
                    Style["min", Bold], 
                    0.001818742646675990029`18.259771250445723}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{16.5, 0.004320146094559407}, {17.5, 
                    0.004320146094559407}, {17.5, 0.0038175110414749567`}, {
                    16.5, 0.0038175110414749567`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{17.5, 0.004031291819395675}, {16.5, 
                    0.004031291819395675}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{17., 0.0038175110414749567`}, {17., 
                    0.0029169209107568986`}}, {{17., 0.004320146094559407}, {
                    17., 0.004994185726800531}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{17.25, 0.0029169209107568986`}, {16.75, 
                    0.0029169209107568986`}}, {{17.25, 
                    0.004994185726800531}, {16.75, 
                    0.004994185726800531}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.004994185726800531161`18.69846468912161"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.004320146094559406281`18.334468437953745"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.00403129181939567479`18.304414241577643"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.00381751104147495671`18.28075030618621"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.002916920910756898647`18.46492465384319"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.004994185726800531161`18.69846468912161}, {
                    Style["75%", Bold], 
                    0.004320146094559406281`18.334468437953745}, {
                    Style["median", Bold], 
                    0.00403129181939567479`18.304414241577643}, {
                    Style["25%", Bold], 
                    0.00381751104147495671`18.28075030618621}, {
                    Style["min", Bold], 
                    0.002916920910756898647`18.46492465384319}}, Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{17.5, 0.0018958130244675967`}, {18.5, 
                    0.0018958130244675967`}, {18.5, 0.0017059100362219989`}, {
                    17.5, 0.0017059100362219989`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{18.5, 0.0018053725496798994`}, {17.5, 
                    0.0018053725496798994`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    LineBox[{{{18., 0.0017059100362219989`}, {18., 
                    0.0014009213509691763`}}, {{18., 
                    0.0018958130244675967`}, {18., 
                    0.0021710469732480874`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{18.25, 0.0014009213509691763`}, {17.75, 
                    0.0014009213509691763`}}, {{18.25, 
                    0.0021710469732480874`}, {17.75, 
                    0.0021710469732480874`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.002171046973248087417`18.33666922004666"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0018958130244675967755`17.976765506933972"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.001805372549679899437`17.955536839151236"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0017059100362219987515`17.930926128586886"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001400921350969176315`18.146413754273016"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.002171046973248087417`18.33666922004666}, {
                    Style["75%", Bold], 
                    0.0018958130244675967755`17.976765506933972}, {
                    Style["median", Bold], 
                    0.001805372549679899437`17.955536839151236}, {
                    Style["25%", Bold], 
                    0.0017059100362219987515`17.930926128586886}, {
                    Style["min", Bold], 
                    0.001400921350969176315`18.146413754273016}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    PolygonBox[{{18.5, 0.004503510791733179}, {19.5, 
                    0.004503510791733179}, {19.5, 0.003942185572269898}, {
                    18.5, 0.003942185572269898}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{19.5, 0.0041945872287766015`}, {18.5, 
                    0.0041945872287766015`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{19., 0.003942185572269898}, {19., 
                    0.003193185674466634}}, {{19., 0.004503510791733179}, {
                    19., 0.004971743715255099}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{19.25, 0.003193185674466634}, {18.75, 
                    0.003193185674466634}}, {{19.25, 0.004971743715255099}, {
                    18.75, 0.004971743715255099}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.004971743715255098894`18.696508733421098"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.004503510791733178649`18.35252121211404"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0041945872287766014505`18.321659234558037"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.003942185572269898096`18.294707068499605"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.003193185674466633879`18.504224172235602"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.004971743715255098894`18.696508733421098}, {
                    Style["75%", Bold], 
                    0.004503510791733178649`18.35252121211404}, {
                    Style["median", Bold], 
                    0.0041945872287766014505`18.321659234558037}, {
                    Style["25%", Bold], 
                    0.003942185572269898096`18.294707068499605}, {
                    Style["min", Bold], 
                    0.003193185674466633879`18.504224172235602}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{19.5, 0.0021857968145294784`}, {20.5, 
                    0.0021857968145294784`}, {20.5, 0.0019442555664305693`}, {
                    19.5, 0.0019442555664305693`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{20.5, 0.002049836226187546}, {19.5, 
                    0.002049836226187546}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{20., 0.0019442555664305693`}, {20., 
                    0.0017448987028522503`}}, {{20., 
                    0.0021857968145294784`}, {20., 0.002436131687844545}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{20.25, 0.0017448987028522503`}, {19.75, 
                    0.0017448987028522503`}}, {{20.25, 
                    0.002436131687844545}, {19.75, 
                    0.002436131687844545}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.002436131687844545011`18.38670076087316"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.002185796814529478204`18.03857979304307"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0020498362261875458825`18.010689168365285"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0019442555664305693175`17.987723355356067"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001744898702852250294`18.2417702197942"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.002436131687844545011`18.38670076087316}, {
                    Style["75%", Bold], 
                    0.002185796814529478204`18.03857979304307}, {
                    Style["median", Bold], 
                    0.0020498362261875458825`18.010689168365285}, {
                    Style["25%", Bold], 
                    0.0019442555664305693175`17.987723355356067}, {
                    Style["min", Bold], 
                    0.001744898702852250294`18.2417702197942}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{20.5, 0.0035027734662870114`}, {21.5, 
                    0.0035027734662870114`}, {21.5, 0.0029731183887410483`}, {
                    20.5, 0.0029731183887410483`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{21.5, 0.0032760838686536832`}, {20.5, 
                    0.0032760838686536832`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{21., 0.0029731183887410483`}, {21., 
                    0.0016049112222244017`}}, {{21., 
                    0.0035027734662870114`}, {21., 
                    0.0039428123319111795`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{21.25, 0.0016049112222244017`}, {20.75, 
                    0.0016049112222244017`}}, {{21.25, 
                    0.0039428123319111795`}, {20.75, 
                    0.0039428123319111795`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.003942812331911179496`18.595806106224874"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.003502773466287011214`18.243382055578124"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0032760838686536830015`18.21432501562564"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0029731183887410485375`18.172182207369836"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001604911222224401739`18.205451013834715"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.003942812331911179496`18.595806106224874}, {
                    Style["75%", Bold], 
                    0.003502773466287011214`18.243382055578124}, {
                    Style["median", Bold], 
                    0.0032760838686536830015`18.21432501562564}, {
                    Style["25%", Bold], 
                    0.0029731183887410485375`18.172182207369836}, {
                    Style["min", Bold], 
                    0.001604911222224401739`18.205451013834715}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{21.5, 0.00187162864276488}, {22.5, 
                    0.00187162864276488}, {22.5, 0.001686754937653452}, {21.5,
                     0.001686754937653452}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{22.5, 0.001766906405537524}, {21.5, 
                    0.001766906405537524}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{22., 0.001686754937653452}, {22., 
                    0.001374857970778669}}, {{22., 0.00187162864276488}, {22.,
                     0.0020524894400884555`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{22.25, 0.001374857970778669}, {21.75, 
                    0.001374857970778669}}, {{22.25, 
                    0.0020524894400884555`}, {21.75, 
                    0.0020524894400884555`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.002052489440088455484`18.312280931383143"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.001871628642764879913`17.971189687201292"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.00176690640553752408`17.94618354952182"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0016867549376534520055`17.9260219944795"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001374857970778668986`18.13825783584408"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.002052489440088455484`18.312280931383143}, {
                    Style["75%", Bold], 
                    0.001871628642764879913`17.971189687201292}, {
                    Style["median", Bold], 
                    0.00176690640553752408`17.94618354952182}, {
                    Style["25%", Bold], 
                    0.0016867549376534520055`17.9260219944795}, {
                    Style["min", Bold], 
                    0.001374857970778668986`18.13825783584408}}, Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{22.5, 0.004116194599778748}, {23.5, 
                    0.004116194599778748}, {23.5, 0.0036138839336116923`}, {
                    22.5, 0.0036138839336116923`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{23.5, 0.0038727378768064944`}, {22.5, 
                    0.0038727378768064944`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{23., 0.0036138839336116923`}, {23., 
                    0.002365424818694491}}, {{23., 0.004116194599778748}, {
                    23., 0.005121044153631453}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{23.25, 0.002365424818694491}, {22.75, 
                    0.002365424818694491}}, {{23.25, 0.005121044153631453}, {
                    22.75, 0.005121044153631453}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.005121044153631452989`18.70935852033661"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0041161945997787476035`18.313465902888098"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0038727378768064943915`18.286988107439072"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.003613883933611692538`18.2569442046358"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.002365424818694491192`18.37390914923726"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.005121044153631452989`18.70935852033661}, {
                    Style["75%", Bold], 
                    0.0041161945997787476035`18.313465902888098}, {
                    Style["median", Bold], 
                    0.0038727378768064943915`18.286988107439072}, {
                    Style["25%", Bold], 
                    0.003613883933611692538`18.2569442046358}, {
                    Style["min", Bold], 
                    0.002365424818694491192`18.37390914923726}}, Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    PolygonBox[{{23.5, 0.00193344510908447}, {24.5, 
                    0.00193344510908447}, {24.5, 0.0017228064624491587`}, {
                    23.5, 0.0017228064624491587`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{24.5, 0.0018316124368935901`}, {23.5, 
                    0.0018316124368935901`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{24., 0.0017228064624491587`}, {24., 
                    0.0015102642286124906`}}, {{24., 0.00193344510908447}, {
                    24., 0.002292524037380559}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{24.25, 0.0015102642286124906`}, {23.75, 
                    0.0015102642286124906`}}, {{24.25, 
                    0.002292524037380559}, {23.75, 
                    0.002292524037380559}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.002292524037380558929`18.360313897993972"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0019334451090844700795`17.985301851207936"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.001831612436893590031`17.96180358811935"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0017228064624491587315`17.93520649651919"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001510264228612490578`18.17905293602791"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.002292524037380558929`18.360313897993972}, {
                    Style["75%", Bold], 
                    0.0019334451090844700795`17.985301851207936}, {
                    Style["median", Bold], 
                    0.001831612436893590031`17.96180358811935}, {
                    Style["25%", Bold], 
                    0.0017228064624491587315`17.93520649651919}, {
                    Style["min", Bold], 
                    0.001510264228612490578`18.17905293602791}}, Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{24.5, 0.005080458682881701}, {25.5, 
                    0.005080458682881701}, {25.5, 0.004438164354330147}, {
                    24.5, 0.004438164354330147}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{25.5, 0.0047360389846408}, {24.5, 
                    0.0047360389846408}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{25., 0.004438164354330147}, {25., 
                    0.002600416433135971}}, {{25., 0.005080458682881701}, {
                    25., 0.006213283622560269}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{25.25, 0.002600416433135971}, {24.75, 
                    0.002600416433135971}}, {{25.25, 0.006213283622560269}, {
                    24.75, 0.006213283622560269}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.006213283622560268962`18.79332117864152"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0050804586828817012085`18.404872928126196"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.004736038984640799591`18.374385272954743"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.004438164354330147339`18.34617338534535"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.002600416433135971025`18.415042901867416"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.006213283622560268962`18.79332117864152}, {
                    Style["75%", Bold], 
                    0.0050804586828817012085`18.404872928126196}, {
                    Style["median", Bold], 
                    0.004736038984640799591`18.374385272954743}, {
                    Style["25%", Bold], 
                    0.004438164354330147339`18.34617338534535}, {
                    Style["min", Bold], 
                    0.002600416433135971025`18.415042901867416}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{25.5, 0.002118053730310554}, {26.5, 
                    0.002118053730310554}, {26.5, 0.0018555064715324691`}, {
                    25.5, 0.0018555064715324691`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{26.5, 0.001968524464370757}, {25.5, 
                    0.001968524464370757}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{26., 0.0018555064715324691`}, {26., 
                    0.0012635360380689681`}}, {{26., 0.002118053730310554}, {
                    26., 0.0024938990652774986`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{26.25, 0.0012635360380689681`}, {25.75, 
                    0.0012635360380689681`}}, {{26.25, 
                    0.0024938990652774986`}, {25.75, 
                    0.0024938990652774986`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.002493899065277498626`18.396878872446425"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0021180537303105541685`18.024906977331945"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.001968524464370756833`17.993110820808063"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.001855506471532469143`17.967432477731645"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001263536038068968116`18.10158763320591"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.002493899065277498626`18.396878872446425}, {
                    Style["75%", Bold], 
                    0.0021180537303105541685`18.024906977331945}, {
                    Style["median", Bold], 
                    0.001968524464370756833`17.993110820808063}, {
                    Style["25%", Bold], 
                    0.001855506471532469143`17.967432477731645}, {
                    Style["min", Bold], 
                    0.001263536038068968116`18.10158763320591}}, Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{26.5, 0.00469959241687902}, {27.5, 
                    0.00469959241687902}, {27.5, 0.0040572172623438004`}, {
                    26.5, 0.0040572172623438004`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{27.5, 0.004332976767476506}, {26.5, 
                    0.004332976767476506}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{27., 0.0040572172623438004`}, {27., 
                    0.0032787614568858337`}}, {{27., 0.00469959241687902}, {
                    27., 0.005447750421260335}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{27.25, 0.0032787614568858337`}, {26.75, 
                    0.0032787614568858337`}}, {{27.25, 
                    0.005447750421260335}, {26.75, 
                    0.005447750421260335}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.00544775042126033511`18.73621720295167"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.004699592416879020285`18.37103019870238"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.00433297676747650606`18.335756364779623"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.004057217262343800011`18.30719826895694"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.003278761456885833682`18.515709821144306"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.00544775042126033511`18.73621720295167}, {
                    Style["75%", Bold], 
                    0.004699592416879020285`18.37103019870238}, {
                    Style["median", Bold], 
                    0.00433297676747650606`18.335756364779623}, {
                    Style["25%", Bold], 
                    0.004057217262343800011`18.30719826895694}, {
                    Style["min", Bold], 
                    0.003278761456885833682`18.515709821144306}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{27.5, 0.002074238145933207}, {28.5, 
                    0.002074238145933207}, {28.5, 0.0018512695941585678`}, {
                    27.5, 0.0018512695941585678`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{28.5, 0.0019552657297872223`}, {27.5, 
                    0.0019552657297872223`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    LineBox[{{{28., 0.0018512695941585678`}, {28., 
                    0.001650268546232258}}, {{28., 0.002074238145933207}, {
                    28., 0.0024138572295482243`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{28.25, 0.001650268546232258}, {27.75, 
                    0.001650268546232258}}, {{28.25, 
                    0.0024138572295482243`}, {27.75, 
                    0.0024138572295482243`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.002413857229548224334`18.382711579658178"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.002074238145933206875`18.015828621156274"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.001955265729787222058`17.990175792736892"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.001851269594158567837`17.966439672537753"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001650268546232258084`18.21755462218779"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.002413857229548224334`18.382711579658178}, {
                    Style["75%", Bold], 
                    0.002074238145933206875`18.015828621156274}, {
                    Style["median", Bold], 
                    0.001955265729787222058`17.990175792736892}, {
                    Style["25%", Bold], 
                    0.001851269594158567837`17.966439672537753}, {
                    Style["min", Bold], 
                    0.001650268546232258084`18.21755462218779}}, Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    PolygonBox[{{28.5, 0.002687527426694525}, {29.5, 
                    0.002687527426694525}, {29.5, 0.0021718098458934744`}, {
                    28.5, 0.0021718098458934744`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{29.5, 0.0024419085062532962`}, {28.5, 
                    0.0024419085062532962`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{29., 0.0021718098458934744`}, {29., 
                    0.0012636126101134445`}}, {{29., 0.002687527426694525}, {
                    29., 0.0031497319160269446`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{29.25, 0.0012636126101134445`}, {28.75, 
                    0.0012636126101134445`}}, {{29.25, 
                    0.0031497319160269446`}, {28.75, 
                    0.0031497319160269446`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.003149731916026944634`18.498273591140457"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0026875274266945253005`18.128322909334585"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.002441908506253296241`18.08669939204737"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.002171809845893474429`18.03579180200496"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.00126361261011344447`18.101613951259196"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.003149731916026944634`18.498273591140457}, {
                    Style["75%", Bold], 
                    0.0026875274266945253005`18.128322909334585}, {
                    Style["median", Bold], 
                    0.002441908506253296241`18.08669939204737}, {
                    Style["25%", Bold], 
                    0.002171809845893474429`18.03579180200496}, {
                    Style["min", Bold], 
                    0.00126361261011344447`18.101613951259196}}, Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{29.5, 0.0017157414948631709`}, {30.5, 
                    0.0017157414948631709`}, {30.5, 0.0015655092732782764`}, {
                    29.5, 0.0015655092732782764`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{30.5, 0.001630330022459703}, {29.5, 
                    0.001630330022459703}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{30., 0.0015655092732782764`}, {30., 
                    0.0013214346439855617`}}, {{30., 
                    0.0017157414948631709`}, {30., 
                    0.0018996387679188066`}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{30.25, 0.0013214346439855617`}, {29.75, 
                    0.0013214346439855617`}}, {{30.25, 
                    0.0018996387679188066`}, {29.75, 
                    0.0018996387679188066`}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.001899638767918806603`18.278671024102973"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0017157414948631708515`17.933421859054114"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0016303300224597030815`17.911245530473455"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0015655092732782763945`17.893625648835524"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001321434643985561729`18.121045688498132"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.001899638767918806603`18.278671024102973}, {
                    Style["75%", Bold], 
                    0.0017157414948631708515`17.933421859054114}, {
                    Style["median", Bold], 
                    0.0016303300224597030815`17.911245530473455}, {
                    Style["25%", Bold], 
                    0.0015655092732782763945`17.893625648835524}, {
                    Style["min", Bold], 
                    0.001321434643985561729`18.121045688498132}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{30.5, 0.004436546220861804}, {31.5, 
                    0.004436546220861804}, {31.5, 0.003849026661215274}, {
                    30.5, 0.003849026661215274}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{31.5, 0.00419074514245283}, {30.5, 
                    0.00419074514245283}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{31., 0.003849026661215274}, {31., 
                    0.002396444906452894}}, {{31., 0.004436546220861804}, {
                    31., 0.005027346595540711}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{31.25, 0.002396444906452894}, {30.75, 
                    0.002396444906452894}}, {{31.25, 0.005027346595540711}, {
                    30.75, 0.005027346595540711}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.005027346595540710741`18.701338827408687"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0044365462208618045185`18.34601501478484"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.004190745142452829974`18.321261254625384"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.00384902666121527434`18.284320923686927"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.002396444906452893826`18.37956744914315"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.005027346595540710741`18.701338827408687}, {
                    Style["75%", Bold], 
                    0.0044365462208618045185`18.34601501478484}, {
                    Style["median", Bold], 
                    0.004190745142452829974`18.321261254625384}, {
                    Style["25%", Bold], 
                    0.00384902666121527434`18.284320923686927}, {
                    Style["min", Bold], 
                    0.002396444906452893826`18.37956744914315}}, Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{31.5, 0.0020285605906909987`}, {32.5, 
                    0.0020285605906909987`}, {32.5, 0.0018158065228634313`}, {
                    31.5, 0.0018158065228634313`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{32.5, 0.001925843729314528}, {31.5, 
                    0.001925843729314528}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{32., 0.0018158065228634313`}, {32., 
                    0.001549630754532167}}, {{32., 0.0020285605906909987`}, {
                    32., 0.002316771152810536}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{32.25, 0.001549630754532167}, {31.75, 
                    0.001549630754532167}}, {{32.25, 0.002316771152810536}, {
                    31.75, 0.002316771152810536}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.002316771152810535948`18.364883136949203"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0020285605906909987165`18.006157988429486"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0019258437293145279315`17.98359104815785"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.001815806522863431258`17.95803957620325"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001549630754532166973`18.190228226961878"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.002316771152810535948`18.364883136949203}, {
                    Style["75%", Bold], 
                    0.0020285605906909987165`18.006157988429486}, {
                    Style["median", Bold], 
                    0.0019258437293145279315`17.98359104815785}, {
                    Style["25%", Bold], 
                    0.001815806522863431258`17.95803957620325}, {
                    Style["min", Bold], 
                    0.001549630754532166973`18.190228226961878}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{32.5, 0.0035024820127442465`}, {33.5, 
                    0.0035024820127442465`}, {33.5, 0.0029629240515143054`}, {
                    32.5, 0.0029629240515143054`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{33.5, 0.0032166620966206268`}, {32.5, 
                    0.0032166620966206268`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{33., 0.0029629240515143054`}, {33., 
                    0.0018715483398990807`}}, {{33., 
                    0.0035024820127442465`}, {33., 0.004278663054965435}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{33.25, 0.0018715483398990807`}, {32.75, 
                    0.0018715483398990807`}}, {{33.25, 
                    0.004278663054965435}, {32.75, 
                    0.004278663054965435}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.004278663054965435239`18.63130808710769"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0035024820127442465345`18.243345917948083"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.0032166620966206267705`18.2063754459403"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0029629240515143054345`18.170690523709762"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001871548339899080675`18.27220104891253"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.004278663054965435239`18.63130808710769}, {
                    Style["75%", Bold], 
                    0.0035024820127442465345`18.243345917948083}, {
                    Style["median", Bold], 
                    0.0032166620966206267705`18.2063754459403}, {
                    Style["25%", Bold], 
                    0.0029629240515143054345`18.170690523709762}, {
                    Style["min", Bold], 
                    0.001871548339899080675`18.27220104891253}}, Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{33.5, 0.0019411099431168896`}, {34.5, 
                    0.0019411099431168896`}, {34.5, 0.001788976152606919}, {
                    33.5, 0.001788976152606919}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{34.5, 0.0018744323073500307`}, {33.5, 
                    0.0018744323073500307`}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{34., 0.001788976152606919}, {34., 
                    0.0014862832547467466`}}, {{34., 
                    0.0019411099431168896`}, {34., 0.002239054162266699}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{34.25, 0.0014862832547467466`}, {33.75, 
                    0.0014862832547467466`}}, {{34.25, 
                    0.002239054162266699}, {33.75, 
                    0.002239054162266699}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.00223905416226669908`18.35006459920165"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.001941109943116889596`17.987020138558368"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.001874432307350030612`17.971839765404503"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.00178897615260691892`17.95157455571376"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001486283254746746619`18.172101584828724"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.00223905416226669908`18.35006459920165}, {
                    Style["75%", Bold], 
                    0.001941109943116889596`17.987020138558368}, {
                    Style["median", Bold], 
                    0.001874432307350030612`17.971839765404503}, {
                    Style["25%", Bold], 
                    0.00178897615260691892`17.95157455571376}, {
                    Style["min", Bold], 
                    0.001486283254746746619`18.172101584828724}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{34.5, 0.0031066460064606534`}, {35.5, 
                    0.0031066460064606534`}, {35.5, 0.002577444911224576}, {
                    34.5, 0.002577444911224576}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{35.5, 0.002855054314927032}, {34.5, 
                    0.002855054314927032}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{35., 0.002577444911224576}, {35., 
                    0.0011453844727722113`}}, {{35., 
                    0.0031066460064606534`}, {35., 0.003569889526390636}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{35.25, 0.0011453844727722113`}, {34.75, 
                    0.0011453844727722113`}}, {{35.25, 
                    0.003569889526390636}, {34.75, 
                    0.003569889526390636}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.003569889526390636076`18.55265477666645"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0031066460064606534265`18.191261773780433"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.002855054314927032034`18.15458437907155"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.002577444911224576179`18.110159396038668"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.001145384472772211296`18.058951291371116"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.003569889526390636076`18.55265477666645}, {
                    Style["75%", Bold], 
                    0.0031066460064606534265`18.191261773780433}, {
                    Style["median", Bold], 
                    0.002855054314927032034`18.15458437907155}, {
                    Style["25%", Bold], 
                    0.002577444911224576179`18.110159396038668}, {
                    Style["min", Bold], 
                    0.001145384472772211296`18.058951291371116}}, 
                  Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{35.5, 0.002247711309500732}, {36.5, 
                    0.002247711309500732}, {36.5, 0.0020300334128051903`}, {
                    35.5, 0.0020300334128051903`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{36.5, 0.002159382959306237}, {35.5, 
                    0.002159382959306237}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{36., 0.0020300334128051903`}, {36., 
                    0.001560487750687233}}, {{36., 0.002247711309500732}, {
                    36., 0.002457048887204092}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{36.25, 0.001560487750687233}, {35.75, 
                    0.001560487750687233}}, {{36.25, 0.002457048887204092}, {
                    35.75, 0.002457048887204092}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.002457048887204092182`18.390413797600047"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0022477113095007320105`18.050710535102258"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.002159382959306236716`18.03329967416665"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0020300334128051900855`18.006473190464746"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.00156048775068723302`18.193260363946678"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.002457048887204092182`18.390413797600047}, {
                    Style["75%", Bold], 
                    0.0022477113095007320105`18.050710535102258}, {
                    Style["median", Bold], 
                    0.002159382959306236716`18.03329967416665}, {
                    Style["25%", Bold], 
                    0.0020300334128051900855`18.006473190464746}, {
                    Style["min", Bold], 
                    0.00156048775068723302`18.193260363946678}}, Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}, {{{}, {{}, {{
              Directive[
               RGBColor[0.982864, 0.7431472, 0.3262672]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{36.5, 0.005307801661790997}, {37.5, 
                    0.005307801661790997}, {37.5, 0.004532388476112879}, {
                    36.5, 0.004532388476112879}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{37.5, 0.004906106077665422}, {36.5, 
                    0.004906106077665422}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{37., 0.004532388476112879}, {37., 
                    0.0029377859157712983`}}, {{37., 0.005307801661790997}, {
                    37., 0.006137412686525318}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{37.25, 0.0029377859157712983`}, {36.75, 
                    0.0029377859157712983`}}, {{37.25, 
                    0.006137412686525318}, {36.75, 
                    0.006137412686525318}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.006137412686525317573`18.787985326714736"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0053078016617909970155`18.423884690420078"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.004906106077665422626`18.389706938431967"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.0045323884761128791985`18.35529713099112"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.002937785915771298252`18.46802014441993"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.006137412686525317573`18.787985326714736}, {
                    Style["75%", Bold], 
                    0.0053078016617909970155`18.423884690420078}, {
                    Style["median", Bold], 
                    0.004906106077665422626`18.389706938431967}, {
                    Style["25%", Bold], 
                    0.0045323884761128791985`18.35529713099112}, {
                    Style["min", Bold], 
                    0.002937785915771298252`18.46802014441993}}, Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], "Tooltip"]& ]}, {
              Directive[
               RGBColor[0.4992, 0.5552, 0.8309304]], 
              TagBox[
               TooltipBox[
                TagBox[
                 DynamicBox[{
                   FEPrivate`If[
                    CurrentValue["MouseOver"], 
                    EdgeForm[{
                    GrayLevel[0.5], 
                    AbsoluteThickness[1.5], 
                    Opacity[0.66]}], {}, {}], 
                   GraphicsGroupBox[{Antialiasing -> False, 
                    
                    PolygonBox[{{37.5, 0.00298311950032477}, {38.5, 
                    0.00298311950032477}, {38.5, 0.0026541191306029594`}, {
                    37.5, 0.0026541191306029594`}}], {}, {{}, {}}, {}, {
                    GrayLevel[0], 
                    GrayLevel[1], 
                    
                    LineBox[{{38.5, 0.002839996250825501}, {37.5, 
                    0.002839996250825501}}]}, {}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{38., 0.0026541191306029594`}, {38., 
                    0.0021522688829553626`}}, {{38., 0.00298311950032477}, {
                    38., 0.003732881898568973}}}]}, {
                    GrayLevel[0], 
                    GrayLevel[0.5], 
                    
                    LineBox[{{{38.25, 0.0021522688829553626`}, {37.75, 
                    0.0021522688829553626`}}, {{38.25, 
                    0.003732881898568973}, {37.75, 
                    0.003732881898568973}}}]}, {}}]}], 
                 "DelayedMouseEffectStyle"], 
                StyleBox[
                 TagBox[
                  GridBox[{{
                    StyleBox["\"max\"", Bold, StripOnInput -> False], 
                    "0.003732881898568973095`18.572044249875095"}, {
                    StyleBox["\"75%\"", Bold, StripOnInput -> False], 
                    "0.0029831195003247701175`18.173640655382336"}, {
                    StyleBox["\"median\"", Bold, StripOnInput -> False], 
                    "0.002839996250825501008`18.15228777105669"}, {
                    StyleBox["\"25%\"", Bold, StripOnInput -> False], 
                    "0.002654119130602959143`18.122890416685966"}, {
                    StyleBox["\"min\"", Bold, StripOnInput -> False], 
                    "0.00215226888295536262`18.332896526794155"}}, 
                   GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
                   AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, "Rows" -> {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, 
                   GridBoxFrame -> {
                    "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}},
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
                   BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], "Grid"], {
                  Directive[12, Bold, 
                   Thickness[Large]]}, StripOnInput -> False]], 
               Annotation[#, 
                Style[
                 Grid[{{
                    Style["max", Bold], 
                    0.003732881898568973095`18.572044249875095}, {
                    Style["75%", Bold], 
                    0.0029831195003247701175`18.173640655382336}, {
                    Style["median", Bold], 
                    0.002839996250825501008`18.15228777105669}, {
                    Style["25%", Bold], 
                    0.002654119130602959143`18.122890416685966}, {
                    Style["min", Bold], 
                    0.00215226888295536262`18.332896526794155}}, Dividers -> {{
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}, {
                    Directive[
                    GrayLevel[0.3]], {
                    Directive[
                    GrayLevel[0.3]]}, 
                    Directive[
                    GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, 
                  Frame -> GrayLevel[0], BaseStyle -> Directive[
                    AbsoluteThickness[1], 
                    Dashing[{}]]], {
                  Directive[12, Bold, 
                   Thickness[Large]]}], 
                "Tooltip"]& ]}}}, {}, {}}}}, {}, {}}}, {{{{{{{{{{}, {}}, {}}, \
{{{}, {}}, {}}}, {}}, {}}, {}}}, {{{{{{{{}, {}}, {}}, {{{}, {}}, {}}}, {}}, \
{}}, {}}}, {{{{{{{{}, {}}, {}}, {{{}, {}}, {}}}, {}}, {}}, {}}}, {{{{{{{{}, \
{}}, {}}, {{{}, {}}, {}}}, {}}, {}}, {}}}, {{{{{{{{}, {}}, {}}, {{{}, {}}, \
{}}}, {}}, {}}, {}}}, {{{{{{{{}, {}}, {}}, {{{}, {}}, {}}}, {}}, {}}, {}}}, \
{{{{{{{{}, {}}, {}}, {{{}, {}}, {}}}, {}}, {}}, {}}}, {{{{{{{{}, {}}, {}}, \
{{{}, {}}, {}}}, {}}, {}}, {}}}, {{{{{{{{}, {}}, {}}, {{{}, {}}, {}}}, {}}, \
{}}, {}}}, {{{{{{{{}, {}}, {}}, {{{}, {}}, {}}}, {}}, {}}, {}}}, {{{{{{{{}, \
{}}, {}}, {{{}, {}}, {}}}, {}}, {}}, {}}}, {{{{{{{{}, {}}, {}}, {{{}, {}}, \
{}}}, {}}, {}}, {}}}, {{{{{{{{}, {}}, {}}, {{{}, {}}, {}}}, {}}, {}}, {}}}, \
{{{{{{{{}, {}}, {}}, {{{}, {}}, {}}}, {}}, {}}, {}}}, {{{{{{{{}, {}}, {}}, \
{{{}, {}}, {}}}, {}}, {}}, {}}}, {{{{{{{{}, {}}, {}}, {{{}, {}}, {}}}, {}}, \
{}}, {}}}, {{{{{{{{}, {}}, {}}, {{{}, {}}, {}}}, {}}, {}}, {}}}, {{{{{{{{}, \
{}}, {}}, {{{}, {}}, {}}}, {}}, {}}, {}}}, {{{{{{{{}, {}}, {}}, {{{}, {}}, \
{}}}, {}}, {}}, {}}}}, {}}, {}}, {{}, {{{
         Directive[
          PointSize[0.012833333333333334`], 
          AbsoluteThickness[1.6], 
          GrayLevel[0]], 
         GeometricTransformationBox[
          InsetBox[
           BoxData[
            FormBox[
             StyleBox[
              GraphicsBox[{
                EdgeForm[], 
                DiskBox[{0, 0}]}], 
              GraphicsBoxOptions -> {DefaultBaseStyle -> Directive[
                  PointSize[0.012833333333333334`], 
                  AbsoluteThickness[1.6], 
                  GrayLevel[0]]}, StripOnInput -> False], TraditionalForm]], {
           0., 0.}, Automatic, 
           Offset[7]], CompressedData["
1:eJxTTMoPSmVmYGAQBmJGIGZigAOHwI2fIysehttDuAIOLFLtUu5zYqF8CQfz
qCk7nvXHQfkKDte1fzuH50ZB+SoOCvsbtfifx0P5Gg42RenPlnyKhvJ1HFzf
aL+2y4PxDRzWC6k9z/ieBOUbOXQJn3x3tiQGyjdxeHZeM9pYIgHKN3MoPair
1DMPJm/hcH6vLfvkLTC+lUOk/69ncdIw+20c5E/fCZDvgfHtHJo3rZtuEwBz
r4PDpf0PmD6HwPzj6PDQIE8pZSHMv04Ox/XCZ4skJkL5zg7LpKdzRjGm2QMA
OtZMjg==
          "]]}}}, {{}, {}}}, {{}, {{{
         Directive[
          PointSize[0.012833333333333334`], 
          AbsoluteThickness[1.6], 
          GrayLevel[0]], 
         GeometricTransformationBox[
          InsetBox[
           BoxData[
            FormBox[
             StyleBox[
              GraphicsBox[{
                EdgeForm[], 
                DiskBox[{0, 0}]}], 
              GraphicsBoxOptions -> {DefaultBaseStyle -> Directive[
                  PointSize[0.012833333333333334`], 
                  AbsoluteThickness[1.6], 
                  GrayLevel[0]]}, StripOnInput -> False], TraditionalForm]], {
           0., 0.}, Automatic, 
           Offset[7]], CompressedData["
1:eJxTTMoPSmVmYGAQBmJGIGZigIEP9hmP17CZhybbQ/gcDkeOXzH0EsyB8kUc
al5t/XiBJRfKl3EQr9zP/aggCcpXcljvFRWTkJkJ5as5rNq2wSPENQ3K13IQ
Wny2ga8qFcrXc2Db51htJ5gP5Rs6bNMzuny+Cma+sYNaVFnGfeMCKN/UIfSW
X430PZh55g6nfKqzN0TA1Fs6pC6b5HBIrQjKt3Y43Pjk0bkomH5bBw3HL5at
PolQvr3DLaWzc9LVofY3ODgsPnFf25IhA8p3dGDpSmVxUIS6t8HJwZxlieXh
O0X2AEIpTUQ=
          "]]}}}, {{}, {}}}}, {
    ImageSize -> 1000, 
     GridLines -> {{0.5, 2.5, 4.5, 6.5, 8.5, 10.5, 12.5, 14.5, 16.5, 18.5, 
       20.5, 22.5, 24.5, 26.5, 28.5, 30.5, 32.5, 34.5, 36.5, 38.5}, {0}}, 
     GridLinesStyle -> {
       Directive[
        Thickness[Large], 
        RGBColor[
        0.7777777777777778, 0.7777777777777778, 0.7777777777777778]], {
        GrayLevel[1]}}, DisplayFunction -> Identity, AspectRatio -> 0.375, 
     Axes -> {False, False}, AxesLabel -> {None, None}, 
     AxesOrigin -> {-1.4000000000000001`, -0.0001992393993272013}, Frame -> 
     True, FrameLabel -> {{None, None}, {None, None}}, FrameStyle -> 
     Directive[12, Bold, 
       Thickness[Large], 
       RGBColor[
       0.33333333333333337`, 0.33333333333333337`, 0.33333333333333337`]], 
     FrameTicks -> {{Automatic, Automatic}, {{{1.5, 
          FormBox["\"1\"", TraditionalForm], {0, 0}}, {3.5, 
          FormBox["\"2\"", TraditionalForm], {0, 0}}, {5.5, 
          FormBox["\"3\"", TraditionalForm], {0, 0}}, {7.5, 
          FormBox["\"4\"", TraditionalForm], {0, 0}}, {9.5, 
          FormBox["\"5\"", TraditionalForm], {0, 0}}, {11.5, 
          FormBox["\"6\"", TraditionalForm], {0, 0}}, {13.5, 
          FormBox["\"7\"", TraditionalForm], {0, 0}}, {15.5, 
          FormBox["\"8\"", TraditionalForm], {0, 0}}, {17.5, 
          FormBox["\"9\"", TraditionalForm], {0, 0}}, {19.5, 
          FormBox["\"10\"", TraditionalForm], {0, 0}}, {21.5, 
          FormBox["\"11\"", TraditionalForm], {0, 0}}, {23.5, 
          FormBox["\"12\"", TraditionalForm], {0, 0}}, {25.5, 
          FormBox["\"13\"", TraditionalForm], {0, 0}}, {27.5, 
          FormBox["\"14\"", TraditionalForm], {0, 0}}, {29.5, 
          FormBox["\"15\"", TraditionalForm], {0, 0}}, {31.5, 
          FormBox["\"16\"", TraditionalForm], {0, 0}}, {33.5, 
          FormBox["\"17\"", TraditionalForm], {0, 0}}, {35.5, 
          FormBox["\"18\"", TraditionalForm], {0, 0}}, {37.5, 
          FormBox["\"19\"", TraditionalForm], {0, 0}}}, {}}}, GridLinesStyle -> 
     Directive[
       GrayLevel[0.5, 0.4]], ImageSize -> Large, LabelStyle -> 
     Directive[12, Bold, 
       Thickness[Large]], PlotRange -> {{2, 37}, {0, All}}, 
     PlotRangePadding -> {{
        Scaled[0.05], 
        Scaled[0.05]}, {
        Scaled[0.05], 
        Scaled[0.05]}}, Ticks -> {{{1.5, 
         FormBox["\"1\"", TraditionalForm], {0, 0}}, {3.5, 
         FormBox["\"2\"", TraditionalForm], {0, 0}}, {5.5, 
         FormBox["\"3\"", TraditionalForm], {0, 0}}, {7.5, 
         FormBox["\"4\"", TraditionalForm], {0, 0}}, {9.5, 
         FormBox["\"5\"", TraditionalForm], {0, 0}}, {11.5, 
         FormBox["\"6\"", TraditionalForm], {0, 0}}, {13.5, 
         FormBox["\"7\"", TraditionalForm], {0, 0}}, {15.5, 
         FormBox["\"8\"", TraditionalForm], {0, 0}}, {17.5, 
         FormBox["\"9\"", TraditionalForm], {0, 0}}, {19.5, 
         FormBox["\"10\"", TraditionalForm], {0, 0}}, {21.5, 
         FormBox["\"11\"", TraditionalForm], {0, 0}}, {23.5, 
         FormBox["\"12\"", TraditionalForm], {0, 0}}, {25.5, 
         FormBox["\"13\"", TraditionalForm], {0, 0}}, {27.5, 
         FormBox["\"14\"", TraditionalForm], {0, 0}}, {29.5, 
         FormBox["\"15\"", TraditionalForm], {0, 0}}, {31.5, 
         FormBox["\"16\"", TraditionalForm], {0, 0}}, {33.5, 
         FormBox["\"17\"", TraditionalForm], {0, 0}}, {35.5, 
         FormBox["\"18\"", TraditionalForm], {0, 0}}, {37.5, 
         FormBox["\"19\"", TraditionalForm], {0, 0}}}, None}}], 
   FormBox[
    FormBox[
     TemplateBox[{"\"GC rate\"", "\"CO rate\""}, "SwatchLegend", 
      DisplayFunction -> (FormBox[
        StyleBox[
         StyleBox[
          PaneBox[
           TagBox[
            GridBox[{{
               TagBox[
                GridBox[{{
                   GraphicsBox[{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.5], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0.982864, 0.7431472, 0.3262672]], 
                    RectangleBox[{0, 0}, {10, 10}, "RoundingRadius" -> 0]}, 
                    AspectRatio -> Full, ImageSize -> {10, 10}, 
                    PlotRangePadding -> None, ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #}, {
                   GraphicsBox[{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.5], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0.4992, 0.5552, 0.8309304]], 
                    RectangleBox[{0, 0}, {10, 10}, "RoundingRadius" -> 0]}, 
                    AspectRatio -> Full, ImageSize -> {10, 10}, 
                    PlotRangePadding -> None, ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #2}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
                 AutoDelete -> False, 
                 GridBoxDividers -> {
                  "Columns" -> {{False}}, "Rows" -> {{False}}}, 
                 GridBoxItemSize -> {"Columns" -> {{All}}, "Rows" -> {{All}}},
                  GridBoxSpacings -> {
                  "Columns" -> {{0.3}}, "Rows" -> {{0.5}}}], "Grid"]}}, 
             GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
             AutoDelete -> False, 
             GridBoxItemSize -> {
              "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
             GridBoxSpacings -> {"Columns" -> {{1}}, "Rows" -> {{0}}}], 
            "Grid"], Alignment -> Left, AppearanceElements -> None, 
           ImageMargins -> {{5, 5}, {5, 5}}, ImageSizeAction -> 
           "ResizeToFit"], LineIndent -> 0, StripOnInput -> False], {
          Directive[12, Bold, 
           Thickness[Large]], FontFamily -> "Arial"}, Background -> Automatic,
          StripOnInput -> False], TraditionalForm]& ), 
      InterpretationFunction :> (RowBox[{"SwatchLegend", "[", 
         RowBox[{
           RowBox[{"{", 
             RowBox[{
               RowBox[{"{", 
                 RowBox[{
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> GrayLevel[0.6666666666666667], FrameTicks -> 
                    None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"GrayLevel", "[", "1", "]"}], NumberMarks -> 
                    False]], Appearance -> None, BaseStyle -> {}, 
                    BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[1], Editable -> False, Selectable -> False], 
                    "]"}]}], "}"}], ",", 
               RowBox[{"{", 
                 RowBox[{
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0.982864, 0.7431472, 0.3262672], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> 
                    RGBColor[
                    0.6552426666666666, 0.4954314666666667, 
                    0.21751146666666665`], FrameTicks -> None, 
                    PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"RGBColor", "[", 
                    
                    RowBox[{"0.982864`", ",", "0.7431472`", ",", 
                    "0.3262672`"}], "]"}], NumberMarks -> False]], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0.982864, 0.7431472, 0.3262672]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0.982864, 0.7431472, 0.3262672], Editable -> 
                    False, Selectable -> False], "]"}], ",", 
                   RowBox[{"Directive", "[", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0.4992, 0.5552, 0.8309304], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> 
                    RGBColor[0.3328, 0.37013333333333337`, 0.5539536], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    StyleBox[
                    RowBox[{"RGBColor", "[", 
                    RowBox[{"0.4992`", ",", "0.5552`", ",", "0.8309304`"}], 
                    "]"}], NumberMarks -> False]], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0.4992, 0.5552, 0.8309304]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0.4992, 0.5552, 0.8309304], Editable -> False, 
                    Selectable -> False], "]"}]}], "}"}]}], "}"}], ",", 
           RowBox[{"{", 
             RowBox[{
               RowBox[{"{", "}"}], ",", 
               RowBox[{"{", 
                 RowBox[{#, ",", #2}], "}"}]}], "}"}], ",", 
           RowBox[{"LegendMarkers", "\[Rule]", 
             RowBox[{"{", 
               RowBox[{
                 RowBox[{"{", "None", "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"Automatic", ",", "Automatic"}], "}"}]}], "}"}]}], 
           ",", 
           RowBox[{"LabelStyle", "\[Rule]", 
             RowBox[{"Directive", "[", 
               RowBox[{"12", ",", "Bold", ",", 
                 RowBox[{"Thickness", "[", "Large", "]"}]}], "]"}]}], ",", 
           RowBox[{"LegendLayout", "\[Rule]", "\"Column\""}]}], "]"}]& ), 
      Editable -> True], TraditionalForm], TraditionalForm]},
  "Legended",
  DisplayFunction->(GridBox[{{
      TagBox[
       ItemBox[
        PaneBox[
         TagBox[#, "SkipImageSizeLevel"], Alignment -> {Center, Baseline}, 
         BaselinePosition -> Baseline], DefaultBaseStyle -> "Labeled"], 
       "SkipImageSizeLevel"], 
      ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
    GridBoxAlignment -> {"Columns" -> {{Center}}, "Rows" -> {{Center}}}, 
    AutoDelete -> False, GridBoxItemSize -> Automatic, 
    BaselinePosition -> {1, 1}]& ),
  Editable->True,
  InterpretationFunction->(RowBox[{"Legended", "[", 
     RowBox[{#, ",", 
       RowBox[{"Placed", "[", 
         RowBox[{#2, ",", "After"}], "]"}]}], "]"}]& )]], "Output",
 CellChangeTimes->{3.8442516374828568`*^9, 3.844307743107291*^9, 
  3.8443077938997097`*^9, 3.844307970630958*^9},
 CellLabel->
  "Out[272]=",ExpressionUUID->"9362d68a-04dd-4d9f-b5ea-17a4760c2006"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"singleLplot", " ", "=", " ", 
  RowBox[{"Show", "[", "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"BoxWhiskerChart", "[", 
     RowBox[{"LsSingle", ",", 
      RowBox[{"BarOrigin", "\[Rule]", "Bottom"}], ",", "\[IndentingNewLine]", 
      
      RowBox[{"LabelStyle", "\[Rule]", 
       RowBox[{"Directive", "[", 
        RowBox[{"12", ",", "Bold", ",", "Thick"}], "]"}]}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"Frame", "\[Rule]", "True"}], ",", 
      RowBox[{"FrameStyle", "\[Rule]", 
       RowBox[{"Directive", "[", 
        RowBox[{"12", ",", "Bold", ",", "Thick", ",", 
         RowBox[{"Darker", "@", "Gray"}]}], "]"}]}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"FrameLabel", "\[Rule]", 
       RowBox[{"{", 
        RowBox[{"\"\<tract length\>\"", ",", "\"\<\>\""}], "}"}]}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"ImageSize", "\[Rule]", "Medium"}], ",", 
      RowBox[{"PlotRange", "\[Rule]", "All"}], ",", "\[IndentingNewLine]", 
      RowBox[{"AspectRatio", "\[Rule]", 
       RowBox[{
        RowBox[{"9", "/", "16"}], "/", 
        RowBox[{"(", "1.5", ")"}]}]}]}], "]"}], ",", "\[IndentingNewLine]", 
    RowBox[{"ListPlot", "[", 
     RowBox[{"truthLs", ",", 
      RowBox[{"PlotStyle", "\[Rule]", "Black"}], ",", 
      RowBox[{"PlotMarkers", "\[Rule]", 
       RowBox[{"{", 
        RowBox[{"Automatic", ",", "Small"}], "}"}]}]}], "]"}], ",", 
    "\[IndentingNewLine]", 
    RowBox[{"ImageSize", "\[Rule]", "1000"}], ",", "\[IndentingNewLine]", 
    RowBox[{"PlotRange", "\[Rule]", 
     RowBox[{"{", 
      RowBox[{"All", ",", 
       RowBox[{"{", 
        RowBox[{"80", ",", "130"}], "}"}]}], "}"}]}]}], "\[IndentingNewLine]",
    "]"}]}]], "Input",
 CellChangeTimes->{{3.844251527659902*^9, 3.8442518994162683`*^9}, {
  3.844307466472567*^9, 3.844307547819682*^9}, {3.844307748217986*^9, 
  3.844307749947348*^9}, {3.844307855914823*^9, 3.844307858346542*^9}, {
  3.844308113937446*^9, 3.844308114507533*^9}, {3.844308161217444*^9, 
  3.8443081661376057`*^9}},
 CellLabel->
  "In[282]:=",ExpressionUUID->"a4c19404-545b-47d2-a38b-3a4ee55da8bc"],

Cell[BoxData[
 GraphicsBox[{{
    {Opacity[0], 
     PointBox[{{-0.19605693430634064`, 89.89699837600428}, {
      2.1960569343063403`, 119.6200742091773}}]}, 
    {RGBColor[0.982864, 0.7431472, 0.3262672], CapForm[None], {}, 
     {RGBColor[0.982864, 0.7431472, 0.3262672], 
      {RGBColor[0.982864, 0.7431472, 0.3262672], 
       TagBox[
        TooltipBox[
         TagBox[
          DynamicBox[{
            FEPrivate`If[
             CurrentValue["MouseOver"], 
             EdgeForm[{
               GrayLevel[0.5], 
               AbsoluteThickness[1.5], 
               Opacity[0.66]}], {}, {}], 
            GraphicsGroupBox[{Antialiasing -> False, 
              
              PolygonBox[{{0.8039430656936596, 107.15791002297301`}, {
               1.1960569343063403`, 107.15791002297301`}, {
               1.1960569343063403`, 100.1980145027761}, {0.8039430656936596, 
               100.1980145027761}}], {}, {{}, {}}, {}, {
               GrayLevel[0], 
               GrayLevel[1], 
               
               LineBox[{{1.1960569343063403`, 103.71299539557897`}, {
                0.8039430656936597, 103.71299539557897`}}]}, {}, {
               GrayLevel[0], 
               GrayLevel[0.5], 
               
               LineBox[{{{1., 100.1980145027761}, {1., 91.24804727751214}}, {{
                1., 107.15791002297301`}, {1., 118.26902530766944`}}}]}, {
               GrayLevel[0], 
               GrayLevel[0.5], 
               
               LineBox[{{{1.0980284671531702`, 91.24804727751214}, {
                0.9019715328468298, 91.24804727751214}}, {{
                1.0980284671531702`, 118.26902530766944`}, {
                0.9019715328468298, 118.26902530766944`}}}]}, {}}]},
           
           ImageSizeCache->{{402.5857864376269, 
            533.4142135623731}, {-89.4142135623731, 71.4142135623731}}],
          "DelayedMouseEffectStyle"],
         StyleBox[
          TagBox[
           GridBox[{{
              StyleBox["\"max\"", Bold, StripOnInput -> False], 
              "118.2690253076694376`18.07287101766797"}, {
              StyleBox["\"75%\"", Bold, StripOnInput -> False], 
              "107.15791002297300595`17.728994239000247"}, {
              StyleBox["\"median\"", Bold, StripOnInput -> False], 
              "103.7129953955789716`17.714803181891746"}, {
              StyleBox["\"25%\"", Bold, StripOnInput -> False], 
              "100.198014502776104`17.69982912008849"}, {
              StyleBox["\"min\"", Bold, StripOnInput -> False], 
              "91.24804727751214273`18.9602235792581"}}, 
            GridBoxAlignment -> {"Columns" -> {Center, ".", {Left}}}, 
            AutoDelete -> False, GridBoxDividers -> {"Columns" -> {
                Directive[
                 GrayLevel[0.3]], {
                 Directive[
                  GrayLevel[0.3]]}, 
                Directive[
                 GrayLevel[0.3]]}, "Rows" -> {
                Directive[
                 GrayLevel[0.3]], {
                 Directive[
                  GrayLevel[0.3]]}, 
                Directive[
                 GrayLevel[0.3]]}}, 
            GridBoxFrame -> {
             "ColumnsIndexed" -> {{{1, -1}, {1, -1}} -> GrayLevel[0]}}, 
            GridBoxItemSize -> {
             "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, BaseStyle -> 
            Directive[
              AbsoluteThickness[1], 
              Dashing[{}]]], "Grid"], {
           Directive[12, Bold, 
            Thickness[Large]]}, StripOnInput -> False]],
        Annotation[#, 
         Style[
          Grid[{{
             Style["max", Bold], 118.2690253076694376`18.07287101766797}, {
             Style["75%", Bold], 107.15791002297300595`17.728994239000247}, {
             Style["median", Bold], 103.7129953955789716`17.714803181891746}, {
             Style["25%", Bold], 100.198014502776104`17.69982912008849}, {
             Style["min", Bold], 91.24804727751214273`18.9602235792581}}, 
           Dividers -> {{
              Directive[
               GrayLevel[0.3]], {
               Directive[
                GrayLevel[0.3]]}, 
              Directive[
               GrayLevel[0.3]]}, {
              Directive[
               GrayLevel[0.3]], {
               Directive[
                GrayLevel[0.3]]}, 
              Directive[
               GrayLevel[0.3]]}}, Alignment -> {{Center, ".", {Left}}}, Frame -> 
           GrayLevel[0], BaseStyle -> Directive[
             AbsoluteThickness[1], 
             Dashing[{}]]], {
           Directive[12, Bold, 
            Thickness[Large]]}], 
         "Tooltip"]& ]}}, {}, {}}, {{{{{{}, {}}, {}}, {}}, {}}, {}}, {}}, {{}, 
    {GrayLevel[0], PointSize[0.012833333333333334`], AbsoluteThickness[1.6], 
     GeometricTransformationBox[InsetBox[
       FormBox[
        StyleBox[
         GraphicsBox[
          {EdgeForm[None], DiskBox[{0, 0}]}],
         StripOnInput->False,
         GraphicsBoxOptions->{DefaultBaseStyle->Directive[
           PointSize[0.012833333333333334`], 
           AbsoluteThickness[1.6], 
           GrayLevel[0]]}],
        TraditionalForm], {0., 0.}, Automatic, Offset[7]], {{{1., 
      108.399686}}, {{1., 108.399686}}}]}, {{}, {}}}},
  AspectRatio->0.375,
  Axes->{False, False},
  AxesLabel->{None, None},
  AxesOrigin->{0.7843373722630256, 89.89699837600428},
  DisplayFunction->Identity,
  Frame->True,
  FrameLabel->{{
     FormBox["\"\"", TraditionalForm], None}, {
     FormBox["\"tract length\"", TraditionalForm], None}},
  FrameStyle->Directive[12, Bold, 
    Thickness[Large], 
    RGBColor[
    0.33333333333333337`, 0.33333333333333337`, 0.33333333333333337`]],
  FrameTicks->{{Automatic, Automatic}, {{{1., 
       FormBox[
        TemplateBox[{0}, "Spacer1"], TraditionalForm], {0.008, 0}}, {
      0.8039430656936596, 
       FormBox[
        TemplateBox[{0}, "Spacer1"], TraditionalForm], {0, 0}}, {
      1.1960569343063403`, 
       FormBox[
        TemplateBox[{0}, "Spacer1"], TraditionalForm], {0, 0}}}, {{1., 
       FormBox[
        TemplateBox[{0}, "Spacer1"], TraditionalForm], {0.008, 0}}, {
      0.8039430656936596, 
       FormBox[
        TemplateBox[{0}, "Spacer1"], TraditionalForm], {0, 0}}, {
      1.1960569343063403`, 
       FormBox[
        TemplateBox[{0}, "Spacer1"], TraditionalForm], {0, 0}}}}},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  ImageSize->1000,
  LabelStyle->Directive[12, Bold, 
    Thickness[Large]],
  PlotRange->{All, {80, 130}},
  PlotRangePadding->{{
     Scaled[0.05], 
     Scaled[0.05]}, {
     Scaled[0.05], 
     Scaled[0.05]}},
  Ticks->{{{1., 
      FormBox[
       TemplateBox[{0}, "Spacer1"], TraditionalForm], {0.008, 0}}, {
     0.8039430656936596, 
      FormBox[
       TemplateBox[{0}, "Spacer1"], TraditionalForm], {0, 0}}, {
     1.1960569343063403`, 
      FormBox[
       TemplateBox[{0}, "Spacer1"], TraditionalForm], {0, 0}}}, 
    Automatic}]], "Output",
 CellChangeTimes->{{3.8443074863145447`*^9, 3.844307548444639*^9}, 
   3.844307751252946*^9, 3.844307860695641*^9, 3.8443081152990513`*^9, 
   3.844308169148799*^9},
 CellLabel->
  "Out[282]=",ExpressionUUID->"b3e1db98-61bd-46de-9980-238dd2544342"]
}, Open  ]],

Cell[BoxData["\[IndentingNewLine]"], "Input",
 CellChangeTimes->{{3.844307935544057*^9, 
  3.844307942255064*^9}},ExpressionUUID->"60f89a0f-2e33-44f5-9758-\
fda211d46c82"]
},
WindowSize->{1295.217391304348, 901.5652173913044},
WindowMargins->{{250.43478260869574`, Automatic}, {
  57.91304347826076, Automatic}},
Magnification:>0.9 Inherited,
FrontEndVersion->"12.1 for Linux x86 (64-bit) (June 19, 2020)",
StyleDefinitions->"Default.nb",
ExpressionUUID->"7b43d2d7-1b73-4d6f-98d2-0d06180a3a70"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[1488, 33, 391, 9, 93, "Text",ExpressionUUID->"61df8be3-3278-4b41-9dc0-f11f0e0d181c"],
Cell[1882, 44, 875, 22, 44, "Input",ExpressionUUID->"1571a6c2-35da-4fa6-b2ce-7ec084e38355"],
Cell[2760, 68, 1922, 57, 132, "Input",ExpressionUUID->"3268ba5f-1135-40f2-8d55-6849191e34d5"],
Cell[4685, 127, 2160, 52, 97, "Input",ExpressionUUID->"5f4fa35d-685e-474e-96f8-68e4cadc89e3"],
Cell[6848, 181, 1328, 34, 62, "Input",ExpressionUUID->"6de67771-f20f-41b4-96ea-cb6ea0128980"],
Cell[CellGroupData[{
Cell[8201, 219, 418, 9, 25, "Input",ExpressionUUID->"b7a83ba5-70ce-41ba-839d-13b45edabb82"],
Cell[8622, 230, 404, 8, 42, "Output",ExpressionUUID->"45ee32a5-65fe-4f7b-a344-fc2aaeef64da"]
}, Open  ]],
Cell[CellGroupData[{
Cell[9063, 243, 716, 12, 25, "Input",ExpressionUUID->"151990f5-b606-4daa-b310-7d51d27409ab"],
Cell[9782, 257, 545, 9, 29, "Output",ExpressionUUID->"ef2da212-3415-404c-aaee-5599eedaebda"]
}, Open  ]],
Cell[CellGroupData[{
Cell[10364, 271, 184, 2, 25, "Input",ExpressionUUID->"4d7270dc-163e-407e-bd8b-f8e603090f67"],
Cell[10551, 275, 1550, 42, 47, "Output",ExpressionUUID->"1492a4df-5bd4-490b-bbcf-9ab58b0465a4"]
}, Open  ]],
Cell[CellGroupData[{
Cell[12138, 322, 195, 3, 25, "Input",ExpressionUUID->"6983ef5d-1847-4b7e-9e2e-3dce184dc32b"],
Cell[12336, 327, 149, 2, 29, "Output",ExpressionUUID->"6852698e-5da3-42d3-b949-a9f50e2dc1a0"]
}, Open  ]],
Cell[CellGroupData[{
Cell[12522, 334, 1315, 35, 44, "Input",ExpressionUUID->"e19d595b-2652-41ae-954b-f23d68748c60"],
Cell[13840, 371, 1881, 48, 47, "Output",ExpressionUUID->"7146fa8d-a8b1-4329-b24b-a1d93b32dfba"],
Cell[15724, 421, 1877, 48, 47, "Output",ExpressionUUID->"0bd4dfe2-3fb6-46fb-b575-71b415de548f"]
}, Open  ]],
Cell[CellGroupData[{
Cell[17638, 474, 474, 13, 25, "Input",ExpressionUUID->"0fa748c7-91ac-436b-badf-9198da4be296"],
Cell[18115, 489, 998, 27, 29, "Output",ExpressionUUID->"058051c9-7e39-45c8-a8c0-1c8078077cb8"]
}, Open  ]],
Cell[CellGroupData[{
Cell[19150, 521, 6067, 128, 290, "Input",ExpressionUUID->"1dd7e958-179c-48ba-8aca-5b39ff746f26"],
Cell[25220, 651, 239839, 5012, 359, "Output",ExpressionUUID->"66e50791-445a-4d0a-a5f9-254f640aec2f"]
}, Open  ]],
Cell[CellGroupData[{
Cell[265096, 5668, 2073, 47, 202, "Input",ExpressionUUID->"eca21f38-8e30-47e7-90cd-31d9e2dd6173"],
Cell[267172, 5717, 7190, 177, 361, "Output",ExpressionUUID->"d7132d96-c8bb-4a8d-a827-8ed84c2026f6"]
}, Open  ]],
Cell[274377, 5897, 306, 6, 132, "Input",ExpressionUUID->"55a062dc-e8d2-4a13-8fdc-c5b4846a1627"],
Cell[CellGroupData[{
Cell[274708, 5907, 6115, 128, 290, "Input",ExpressionUUID->"5f4e2a62-d343-441c-a9ae-2a703afcf53a"],
Cell[280826, 6037, 239768, 5010, 359, "Output",ExpressionUUID->"9362d68a-04dd-4d9f-b5ea-17a4760c2006"]
}, Open  ]],
Cell[CellGroupData[{
Cell[520631, 11052, 2125, 48, 202, "Input",ExpressionUUID->"a4c19404-545b-47d2-a38b-3a4ee55da8bc"],
Cell[522759, 11102, 7158, 176, 361, "Output",ExpressionUUID->"b3e1db98-61bd-46de-9980-238dd2544342"]
}, Open  ]],
Cell[529932, 11281, 171, 3, 44, "Input",ExpressionUUID->"60f89a0f-2e33-44f5-9758-fda211d46c82"]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature Gu0dUgv9Dvg7CDwZSE1rdfrS *)
