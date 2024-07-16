
void CheckColumnData(string s2da, string sColumn, int nResType);

void main()
{
    // Checks some stuff for validity in spells.2da

    DelayCommand(0.0, CheckColumnData("spells", "ImpactScript", RESTYPE_NSS));
    DelayCommand(0.0, CheckColumnData("spells", "ConjHeadVisual", RESTYPE_MDL));
    DelayCommand(0.0, CheckColumnData("spells", "ConjHandVisual", RESTYPE_MDL));
    DelayCommand(0.0, CheckColumnData("spells", "ConjGrndVisual", RESTYPE_MDL));
    DelayCommand(0.0, CheckColumnData("spells", "ConjSoundVFX", RESTYPE_WAV));
    DelayCommand(0.0, CheckColumnData("spells", "ConjSoundMale", RESTYPE_WAV));
    DelayCommand(0.0, CheckColumnData("spells", "ConjSoundFemale", RESTYPE_WAV));
    DelayCommand(0.0, CheckColumnData("spells", "CastHeadVisual", RESTYPE_MDL));
    DelayCommand(0.0, CheckColumnData("spells", "CastHandVisual", RESTYPE_MDL));
    DelayCommand(0.0, CheckColumnData("spells", "CastGrndVisual", RESTYPE_MDL));
    DelayCommand(0.0, CheckColumnData("spells", "CastSound", RESTYPE_WAV));
    DelayCommand(0.0, CheckColumnData("spells", "ProjModel", RESTYPE_MDL));
    DelayCommand(0.0, CheckColumnData("spells", "ProjSound", RESTYPE_WAV));
    DelayCommand(0.0, CheckColumnData("spells", "CastGrndVisual", RESTYPE_MDL));
    DelayCommand(0.0, CheckColumnData("spells", "CastGrndVisual", RESTYPE_MDL));
    DelayCommand(0.0, CheckColumnData("spells", "CastGrndVisual", RESTYPE_MDL));
    DelayCommand(0.0, CheckColumnData("spells", "CastGrndVisual", RESTYPE_MDL));

    //    CheckSpellsColumn("CastGrndVisual", RESTYPE_MDL);
    //    CheckSpellsColumn("CastGrndVisual", RESTYPE_MDL);
    //    CheckSpellsColumn("CastGrndVisual", RESTYPE_MDL);
}

void CheckColumnData(string s2da, string sColumn, int nResType)
{
    int nRow;
    int nTotal = Get2DARowCount(s2da);
    for (nRow = 0; nRow <= nTotal; nRow++)
    {
        string sData = Get2DAString(s2da, sColumn, nRow);

        if (sData != "")
        {
            if (ResManGetAliasFor(sData, nResType) == "")
            {
                WriteTimestampedLogEntry("[" + s2da + " check] Column: " + sColumn + " row: " + IntToString(nRow) + " hasn't got this data: " + sData);
            }
        }
    }
}
