//::///////////////////////////////////////////////
//:: Name ud_winds04
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Event User Defined Handler for Chamber of the Mythallar
    - Destroys all Mythallar in a chain reaction once the
    active Mythallar has been destroyed.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: May 6/03
//:://////////////////////////////////////////////

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if (nEvent == 1999)
    {
        object oMyth1 = GetObjectByTag("Mythallar_01");
        object oMyth2 = GetObjectByTag("Mythallar_02");
        object oMyth3 = GetObjectByTag("Mythallar_03");
        object oMyth4 = GetObjectByTag("Mythallar_04");
        object oMyth5 = GetObjectByTag("Mythallar_05");
        object oMyth6 = GetObjectByTag("Mythallar_06");
        object oMyth7 = GetObjectByTag("Mythallar_07");
        object oMyth8 = GetObjectByTag("Mythallar_08");
        object oMyth9 = GetObjectByTag("Mythallar_09");
        object oMyth10 = GetObjectByTag("Mythallar_10");
        object oMyth11 = GetObjectByTag("Mythallar_11");
        object oMyth12 = GetObjectByTag("Mythallar_12");
        object oMyth13 = GetObjectByTag("Mythallar_13");
        object oMyth14 = GetObjectByTag("Mythallar_14");
        object oMyth15 = GetObjectByTag("Mythallar_15");
        object oMyth16 = GetObjectByTag("Mythallar_16");

        //Just destroy all mythallar
        /*
        DestroyObject(oMyth1);
        DestroyObject(oMyth2);
        DestroyObject(oMyth3);
        DestroyObject(oMyth4);
        DestroyObject(oMyth5);
        DestroyObject(oMyth6);
        DestroyObject(oMyth7);
        DestroyObject(oMyth8);
        DestroyObject(oMyth9);
        DestroyObject(oMyth10);
        DestroyObject(oMyth11);
        DestroyObject(oMyth12);
        DestroyObject(oMyth13);
        DestroyObject(oMyth14);
        DestroyObject(oMyth15);
        DestroyObject(oMyth16);
        */
        //Damage each mythallar in a ring, two at a time

        effect eDamage = EffectDamage(500);

        float fDelay = 4.0;
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oMyth1));
        fDelay = fDelay + 4.0;
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oMyth2));
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oMyth16));
        fDelay = fDelay + 4.0;
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oMyth3));
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oMyth15));
        fDelay = fDelay + 4.0;
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oMyth4));
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oMyth14));
        fDelay = fDelay + 4.0;
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oMyth5));
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oMyth13));
        fDelay = fDelay + 4.0;
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oMyth6));
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oMyth12));
        fDelay = fDelay + 4.0;
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oMyth7));
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oMyth11));
        fDelay = fDelay + 4.0;
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oMyth8));
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oMyth10));
        fDelay = fDelay + 4.0;
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oMyth9));

    }
}
