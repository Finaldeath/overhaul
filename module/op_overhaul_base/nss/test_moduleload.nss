

// Checks s2da's sColumn for valid data, if found checks against a RESTYPE_* constant nResType
void CheckColumnData(string s2da, string sColumn, int nResType);

// Checks s2da for sColumn data, if found checks sRef2da for sRefColumn based on the data in sColumn
void CheckColumnRowData(string s2da, string sColumn, string sRef2da, string sRefColumn);

// If valid sColumn data check if it is within nStart and nEnd, blank entries are ignored
void CheckColumnRowDataRange(string s2da, string sColumn, int nStart, int nEnd);

// If valid sColumn data is a valid non-blank TLK String
void CheckColumnRowTlkString(string s2da, string sColumn);

void main()
{
    // Checks some stuff for validity in spells.2da
    DelayCommand(0.0, CheckColumnRowTlkString("spells", "Name"));
    DelayCommand(0.0, CheckColumnRowTlkString("spells", "SpellDesc"));
    DelayCommand(0.0, CheckColumnData("spells", "IconResRef", RESTYPE_TGA));
    DelayCommand(0.0, CheckColumnData("spells", "ImpactScript", RESTYPE_NSS));
    DelayCommand(0.0, CheckColumnRowDataRange("spells", "Bard", 0, 6));
    DelayCommand(0.0, CheckColumnRowDataRange("spells", "Cleric", 0, 9));
    DelayCommand(0.0, CheckColumnRowDataRange("spells", "Druid", 0, 9));
    DelayCommand(0.0, CheckColumnRowDataRange("spells", "Paladin", 1, 4));
    DelayCommand(0.0, CheckColumnRowDataRange("spells", "Ranger", 1, 4));
    DelayCommand(0.0, CheckColumnRowDataRange("spells", "Wiz_Sorc", 0, 9));
    DelayCommand(0.0, CheckColumnRowDataRange("spells", "Innate", 0, 10));
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

    DelayCommand(0.0, CheckColumnRowData("spells", "Master", "spells", "Name"));
    DelayCommand(0.0, CheckColumnRowData("spells", "SubRadSpell1", "spells", "Name"));
    DelayCommand(0.0, CheckColumnRowData("spells", "SubRadSpell2", "spells", "Name"));
    DelayCommand(0.0, CheckColumnRowData("spells", "SubRadSpell3", "spells", "Name"));
    DelayCommand(0.0, CheckColumnRowData("spells", "SubRadSpell4", "spells", "Name"));
    DelayCommand(0.0, CheckColumnRowData("spells", "SubRadSpell5", "spells", "Name"));
    DelayCommand(0.0, CheckColumnRowData("spells", "SubRadSpell6", "spells", "Name"));
    DelayCommand(0.0, CheckColumnRowData("spells", "SubRadSpell7", "spells", "Name"));
    DelayCommand(0.0, CheckColumnRowData("spells", "SubRadSpell8", "spells", "Name"));
    DelayCommand(0.0, CheckColumnRowData("spells", "FeatID", "feat", "FEAT"));
    DelayCommand(0.0, CheckColumnRowData("spells", "Counter1", "spells", "Name"));
    DelayCommand(0.0, CheckColumnRowData("spells", "Counter2", "spells", "Name"));

    // feat.2da
    DelayCommand(0.0, CheckColumnRowTlkString("spells", "FEAT"));
    DelayCommand(0.0, CheckColumnRowTlkString("spells", "Description"));
    DelayCommand(0.0, CheckColumnData("spells", "Icon", RESTYPE_TGA));
    DelayCommand(0.0, CheckColumnRowData("feat", "PREREQFEAT1", "feat", "FEAT"));
    DelayCommand(0.0, CheckColumnRowData("feat", "PREREQFEAT2", "feat", "FEAT"));
    DelayCommand(0.0, CheckColumnRowData("feat", "SPELLID", "spells", "Name"));
    DelayCommand(0.0, CheckColumnRowData("feat", "MASTERFEAT", "feat", "FEAT"));
    DelayCommand(0.0, CheckColumnRowData("feat", "OrReqFeat0", "feat", "FEAT"));
    DelayCommand(0.0, CheckColumnRowData("feat", "OrReqFeat1", "feat", "FEAT"));
    DelayCommand(0.0, CheckColumnRowData("feat", "OrReqFeat2", "feat", "FEAT"));
    DelayCommand(0.0, CheckColumnRowData("feat", "OrReqFeat3", "feat", "FEAT"));
    DelayCommand(0.0, CheckColumnRowData("feat", "OrReqFeat4", "feat", "FEAT"));

    // racialtypes.
    DelayCommand(0.0, CheckColumnRowTlkString("racialtypes", "Name"));
    DelayCommand(0.0, CheckColumnRowTlkString("racialtypes", "ConverName"));
    DelayCommand(0.0, CheckColumnRowTlkString("racialtypes", "ConverNameLower"));
    DelayCommand(0.0, CheckColumnRowTlkString("racialtypes", "NamePlural"));
    DelayCommand(0.0, CheckColumnRowTlkString("racialtypes", "Description"));
    DelayCommand(0.0, CheckColumnData("racialtypes", "Icon", RESTYPE_TGA));
    DelayCommand(0.0, CheckColumnRowData("racialtypes", "Appearance", "appearance", "Label"));
    DelayCommand(0.0, CheckColumnRowData("racialtypes", "Favored", "classes", "Label"));
    DelayCommand(0.0, CheckColumnData("racialtypes", "FeatsTable", RESTYPE_2DA));
    DelayCommand(0.0, CheckColumnRowTlkString("racialtypes", "Biography"));
    DelayCommand(0.0, CheckColumnRowData("racialtypes", "ToolsetDefaultClass", "classes", "Label"));
    DelayCommand(0.0, CheckColumnData("racialtypes", "NameGenTableA", RESTYPE_LTR));
    DelayCommand(0.0, CheckColumnData("racialtypes", "NameGenTableB", RESTYPE_LTR));
    DelayCommand(0.0, CheckColumnRowData("racialtypes", "FavoredEnemyFeat", "feat", "FEAT"));

    // classes.2da
    DelayCommand(0.0, CheckColumnRowTlkString("classes", "Short"));
    DelayCommand(0.0, CheckColumnRowTlkString("classes", "Name"));
    DelayCommand(0.0, CheckColumnRowTlkString("classes", "Plural"));
    DelayCommand(0.0, CheckColumnRowTlkString("classes", "Lower"));
    DelayCommand(0.0, CheckColumnRowTlkString("classes", "Description"));
    DelayCommand(0.0, CheckColumnData("classes", "AttackBonusTable", RESTYPE_2DA));
    DelayCommand(0.0, CheckColumnData("classes", "FeatsTable", RESTYPE_2DA));
    DelayCommand(0.0, CheckColumnData("classes", "SavingThrowTable", RESTYPE_2DA));
    DelayCommand(0.0, CheckColumnData("classes", "SkillsTable", RESTYPE_2DA));
    DelayCommand(0.0, CheckColumnData("classes", "BonusFeatsTable", RESTYPE_2DA));
    DelayCommand(0.0, CheckColumnData("classes", "SpellGainTable", RESTYPE_2DA));
    DelayCommand(0.0, CheckColumnData("classes", "SpellKnownTable", RESTYPE_2DA));
    DelayCommand(0.0, CheckColumnData("classes", "PreReqTable", RESTYPE_2DA));
    DelayCommand(0.0, CheckColumnData("classes", "StatGainTable", RESTYPE_2DA));
    DelayCommand(0.0, CheckColumnRowData("classes", "Package", "packages", "Name"));

    // packages.2da
    DelayCommand(0.0, CheckColumnRowTlkString("packages", "Name"));
    DelayCommand(0.0, CheckColumnRowTlkString("packages", "Description"));
    DelayCommand(0.0, CheckColumnRowData("packages", "ClassID", "classes", "Name"));
    DelayCommand(0.0, CheckColumnData("packages", "SpellPref2DA", RESTYPE_2DA));
    DelayCommand(0.0, CheckColumnData("packages", "FeatPref2DA", RESTYPE_2DA));
    DelayCommand(0.0, CheckColumnData("packages", "SkillPref2DA", RESTYPE_2DA));
    DelayCommand(0.0, CheckColumnData("packages", "Equip2DA", RESTYPE_2DA));

    // vfx_persistent.2da
    DelayCommand(0.0, CheckColumnData("vfx_persistent", "ONENTER", RESTYPE_NCS));
    DelayCommand(0.0, CheckColumnData("vfx_persistent", "ONEXIT", RESTYPE_NCS));
    DelayCommand(0.0, CheckColumnData("vfx_persistent", "ONHEARTBEAT", RESTYPE_NCS));
    DelayCommand(0.0, CheckColumnRowData("vfx_persistent", "DurationVFX", "visualeffects", "Label"));
    DelayCommand(0.0, CheckColumnData("vfx_persistent", "MODEL01", RESTYPE_MDL));
    DelayCommand(0.0, CheckColumnData("vfx_persistent", "MODEL02", RESTYPE_MDL));
    DelayCommand(0.0, CheckColumnData("vfx_persistent", "MODEL03", RESTYPE_MDL));
    DelayCommand(0.0, CheckColumnData("vfx_persistent", "SoundImpact", RESTYPE_WAV));
    DelayCommand(0.0, CheckColumnData("vfx_persistent", "SoundDuration", RESTYPE_WAV));
    DelayCommand(0.0, CheckColumnData("vfx_persistent", "SoundCessation", RESTYPE_WAV));
    DelayCommand(0.0, CheckColumnData("vfx_persistent", "SoundOneShot", RESTYPE_WAV));
    DelayCommand(0.0, CheckColumnData("vfx_persistent", "MODELMIN01", RESTYPE_MDL));
    DelayCommand(0.0, CheckColumnData("vfx_persistent", "MODELMIN02", RESTYPE_MDL));
    DelayCommand(0.0, CheckColumnData("vfx_persistent", "MODELMIN03", RESTYPE_MDL));

    // visualeffects.2da
    DelayCommand(0.0, CheckColumnData("visualeffects", "Imp_HeadCon_Node", RESTYPE_MDL));
    DelayCommand(0.0, CheckColumnData("visualeffects", "Imp_Impact_Node", RESTYPE_MDL));
    DelayCommand(0.0, CheckColumnData("visualeffects", "Imp_Root_S_Node", RESTYPE_MDL));
    DelayCommand(0.0, CheckColumnData("visualeffects", "Imp_Root_M_Node", RESTYPE_MDL));
    DelayCommand(0.0, CheckColumnData("visualeffects", "Imp_Root_L_Node", RESTYPE_MDL));
    DelayCommand(0.0, CheckColumnData("visualeffects", "Imp_Root_H_Node", RESTYPE_MDL));
    DelayCommand(0.0, CheckColumnRowData("visualeffects", "ProgFX_Impact", "progfx", "Label"));
    DelayCommand(0.0, CheckColumnRowData("visualeffects", "ProgFX_Duration", "progfx", "Label"));
    DelayCommand(0.0, CheckColumnRowData("visualeffects", "ProgFX_Cessation", "progfx", "Label"));
    DelayCommand(0.0, CheckColumnData("visualeffects", "SoundImpact", RESTYPE_WAV));
    DelayCommand(0.0, CheckColumnData("visualeffects", "SoundCessastion", RESTYPE_WAV));
    DelayCommand(0.0, CheckColumnRowData("visualeffects", "LowViolence", "visualeffects", "Label"));
    DelayCommand(0.0, CheckColumnData("visualeffects", "LowQuality", RESTYPE_MDL));

}

// Checks s2da's sColumn for valid data, if found checks against a RESTYPE_* constant nResType
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
                WriteTimestampedLogEntry("[" + s2da + " check] Column: " + sColumn + " row: " + IntToString(nRow) + " labelled: " + Get2DAString(s2da, "Label", nRow) + " we cannot find this data: [" + sData + "] as restype: [" + IntToString(nResType) + "]");
            }
        }
    }
}

// Checks s2da for sColumn data, if found checks sRef2da for sRefColumn based on the data in sColumn
void CheckColumnRowData(string s2da, string sColumn, string sRef2da, string sRefColumn)
{
    int nRow;
    int nTotal = Get2DARowCount(s2da);
    for (nRow = 0; nRow <= nTotal; nRow++)
    {
        string sData = Get2DAString(s2da, sColumn, nRow);

        if (sData != "")
        {
            string sData2 = Get2DAString(sRef2da, sRefColumn, StringToInt(sData));
            if (sData2 == "")
            {
                WriteTimestampedLogEntry("[" + s2da + " check] Column: " + sColumn + " row: " + IntToString(nRow) + " labelled: " + Get2DAString(s2da, "Label", nRow) + " hasn't got this  data: [" + sData + "] in: " + sRef2da + ".2da column: " + sRefColumn);
            }
        }
    }
}

// If valid sColumn data check if it is within nStart and nEnd, blank entries are ignored
void CheckColumnRowDataRange(string s2da, string sColumn, int nStart, int nEnd)
{
    int nRow;
    int nTotal = Get2DARowCount(s2da);
    for (nRow = 0; nRow <= nTotal; nRow++)
    {
        string sData = Get2DAString(s2da, sColumn, nRow);

        if (sData != "")
        {
            int nData = StringToInt(sData);
            if (nData < nStart || nData > nEnd)
            {
                WriteTimestampedLogEntry("[" + s2da + " check] Column: " + sColumn + " row: " + IntToString(nRow) + " labelled: " + Get2DAString(s2da, "Label", nRow) + " data: " + sData + " is out of data range [" + IntToString(nStart) + " to " + IntToString(nEnd) + "]");
            }
        }
    }
}


// If valid sColumn data is a valid non-blank TLK String
void CheckColumnRowTlkString(string s2da, string sColumn)
{
    int nRow;
    int nTotal = Get2DARowCount(s2da);
    for (nRow = 0; nRow <= nTotal; nRow++)
    {
        string sData = Get2DAString(s2da, sColumn, nRow);

        if (sData != "")
        {
            int nData = StringToInt(sData);
            if (nData != 16777217) // Intentionally blank TLK string
            {
                string sTLK = GetStringByStrRef(nData);
                if (sTLK == "")
                {
                    WriteTimestampedLogEntry("[" + s2da + " check] Column: " + sColumn + " row: " + IntToString(nRow) + " labelled: " + Get2DAString(s2da, "Label", nRow) + " data: " + sData + " is a blank TLK string");
                }
            }
        }
    }
}
