void CreateFireLine(object oFirePoint);

void main()
{
    int nHBCount = GetLocalInt(OBJECT_SELF, "Q3_HB_COUNT"); // running only every few heartbeats
    nHBCount++;
    if(nHBCount == 3)
        nHBCount = 0;
    SetLocalInt(OBJECT_SELF, "Q3_HB_COUNT", nHBCount);
    if(nHBCount != 0)
        return;
    float fDelay = 2.1;
    int nCount = 1;
    object oPath = GetObjectByTag("WP_Q3_FIREPATH" + "_0" + IntToString(nCount));
    while (oPath != OBJECT_INVALID)
    {
        nCount = nCount + 1;
        //if(nCount == 63)
        //    nCount = 1;
        DelayCommand(fDelay, CreateFireLine(oPath));
        fDelay = fDelay + 0.5;
        if(nCount <= 9)
            oPath = GetObjectByTag("WP_Q3_FIREPATH" + "_0" + IntToString(nCount));
        else
            oPath = GetObjectByTag("WP_Q3_FIREPATH" + "_" + IntToString(nCount));
    }
    //DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE), GetObjectByTag("door" + IntToString(nPath))));
    //DelayCommand(fDelay, AssignCommand(oPC, PlaySound("as_sw_metalop1")));
}

void CreateFireLine(object oFirePoint)
{                                                 //firelarge, sparkstest, soltest, dusttest

    //object oFire = CreateObject(OBJECT_TYPE_PLACEABLE, "firelarge", GetLocation(oFirePoint));
    //DestroyObject(oFire, 1.75);
    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, EffectVisualEffect(407), GetLocation(oFirePoint), 1.75);
}
