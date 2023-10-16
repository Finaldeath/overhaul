// returns the class that oPC has most levels in

int GetDominantClass(object oPC)
{
    int nMaxClass = 0;
    int nClass1 = GetLevelByPosition(1, oPC);
    int nClass2 = GetLevelByPosition(2, oPC);
    int nClass3 = GetLevelByPosition(3, oPC);
    nMaxClass = nClass1;
    int nMaxClassType;

    if(nClass1 > nClass2)
    {
        nMaxClass = nClass1;
        nMaxClassType = GetClassByPosition(1, oPC);
    }
    else
    {
        nMaxClassType = GetClassByPosition(2, oPC);
        nMaxClass = nClass2;
    }

    if(nClass3 > nMaxClass)
    {
        nMaxClassType = GetClassByPosition(3, oPC);
        nMaxClass = nClass3;
    }

    return nMaxClassType;
}


void main()
{
    SetLocalInt(OBJECT_SELF, "Q2B_PLATES_STATUS", 2); // 2=> puzzle solved
            object oSac = GetObjectByTag("Q2B_SAC");
            int nClass = GetDominantClass(GetFirstPC());
            if(nClass == CLASS_TYPE_WIZARD ||
               nClass == CLASS_TYPE_SORCERER)
            {
                CreateItemOnObject("q2_alrashid3", oSac);
            }
            else if (nClass == CLASS_TYPE_MONK)
            {
                CreateItemOnObject("q2_alrashid1", oSac);
            }
            else if (nClass == CLASS_TYPE_DRUID)
            {
                CreateItemOnObject("q2_alrashid4", oSac);
            }
            else
            {
                CreateItemOnObject("q2_alrashid2", oSac);
            }
            effect eVis = EffectVisualEffect(VFX_IMP_SUPER_HEROISM);
            effect eRumble = EffectVisualEffect(VFX_FNF_SCREEN_SHAKE);
            effect eLink = EffectLinkEffects(eVis, eRumble);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oSac);
            SetLocked(oSac, FALSE);
            DelayCommand(1.0, AssignCommand(oSac, ActionPlayAnimation(ANIMATION_PLACEABLE_OPEN)));
            object oPC = GetFirstPC();
            while(oPC != OBJECT_INVALID)
            {
                GiveXPToCreature(oPC, 200);
                oPC = GetNextPC();
            }

}
