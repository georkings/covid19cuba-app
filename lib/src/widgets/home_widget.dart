import 'package:flutter/material.dart';

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/widgets/widgets.dart';

class HomeWidget extends StatelessWidget {
  final DataModel data;

  const HomeWidget({this.data}) : assert(data != null);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          color: Constants.primaryColor,
          child:
              ResumeWidget(resume: data.all.resume, updated: data.all.updated),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            color: Colors.red,
            child: NoteWidget(note: data.all.note),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: MapWebViewWidget(mapData: data.all.mapData),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: PieSexWidget(casesBySex: data.all.casesBySex),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: PieContagionWidget(
              casesByModeOfContagion: data.all.casesByModeOfContagion,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: EvolutionCasesWidget(
              evolutionOfCasesByDays: data.all.evolutionOfCasesByDays,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: EvolutionRecoveredWidget(
              evolutionOfRecoveredByDays: data.all.evolutionOfRecoveredByDays,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: EvolutionDeathWidget(
              evolutionOfDeathsByDays: data.all.evolutionOfDeathsByDays,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: DistributionAgeGroupsDiagnosedWidget(
              distributionByAgeRanges: data.all.distributionByAgeRanges,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: PieCasesNationalityWidget(
              casesByNationality: data.all.casesByNationality,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: DistributionNationalityDiagnosedWidget(
              distributionByNationalityOfForeignCases:
                  data.all.distributionByNationalityOfForeignCases,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: PieTestsPercentWidget(
              listOfTestsPerformed: data.all.listOfTestsPerformed,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: TestEvolutionWidget(testsByDays: data.all.testsByDays),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: Container(
              child: TableData(
                title: 'TOP10 Provincias Afectadas',
                subtitle: 'Provincias',
                description: '% del total de casos',
                keys: data.all.affectedProvinces
                    .map(
                      (x) => x.name,
                    )
                    .take(10)
                    .toList(),
                values: data.all.affectedProvinces
                    .map(
                      (x) => (x.value * 100 / x.total).toStringAsFixed(2) + '%',
                    )
                    .take(10)
                    .toList(),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: Container(
              child: TableData(
                title: 'TOP10 Municipios Afectados',
                subtitle: 'Municipios',
                description: '% del total de casos',
                keys: data.all.affectedMunicipalities
                    .map(
                      (x) => '${x.name} (${x.province})',
                    )
                    .take(10)
                    .toList(),
                values: data.all.affectedMunicipalities
                    .map(
                      (x) => (x.value * 100 / x.total).toStringAsFixed(2) + '%',
                    )
                    .take(10)
                    .toList(),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: ProvincesComparisonWidget(provinces: data.provinces),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: ComparisonWidget(
              comparisonOfAccumulatedCases:
                  data.all.comparisonOfAccumulatedCases,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: Container(
              child: Top20CountriesWidget(
                top20AccumulatedCountries: data.all.top20AccumulatedCountries,
                updated: data.all.comparisonOfAccumulatedCases.updated,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: Container(
              child: CurvesEvolutionWidget(
                curvesEvolution: data.all.curvesEvolution,
                updated: data.all.comparisonOfAccumulatedCases.updated,
              ),
            ),
          ),
        ),
        Container(padding: EdgeInsets.all(5)),
      ],
    );
  }
}
