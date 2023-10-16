//::///////////////////////////////////////////////
//:: Name: q2bn_heartbeat
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Area Heartbeat script - control the maze trap effects.

    Set up wandering monsters on the first Heartbeat.
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:June 17/03
//:://////////////////////////////////////////////

void main()
{
    int nFound = 0;
    object oPC = GetFirstPC();

    while (oPC != OBJECT_INVALID)
    {
        if (GetArea(oPC) == OBJECT_SELF)
            nFound = 1;
        oPC = GetNextPC();
    }
    if (nFound > 0)
    {
        //Anyone in the trap room itself?
        if (GetLocalInt(GetModule(), "nQ2BMazeTrapCount") == 0)
            return;

        //Special Trap 1 - The trigger Maze
        object oTarget1 = GetObjectByTag("tgt_q2bn_targetpillar_1");
        object oTarget2 = GetObjectByTag("tgt_q2bn_targetpillar_2");
        object oTarget3 = GetObjectByTag("tgt_q2bn_targetpillar_3");
        object oTarget4 = GetObjectByTag("tgt_q2bn_targetpillar_4");
        object oTarget5 = GetObjectByTag("tgt_q2bn_targetpillar_5");
        effect eEffect1 = EffectVisualEffect(VFX_DUR_SPELLTURNING);
        effect eEffect2 = EffectVisualEffect(VFX_FNF_SOUND_BURST);
        float fRandom;
        if (GetIsObjectValid(oTarget1) == TRUE && GetLocalInt(oTarget1, "nReady") == 0)
        {
            SetLocalInt(oTarget1, "nReady", 1);
            fRandom = IntToFloat(Random(12) + 1);
            DelayCommand(fRandom, ApplyEffectAtLocation(DURATION_TYPE_PERMANENT,eEffect1, GetLocation(oTarget1)));
            DelayCommand(fRandom, ApplyEffectAtLocation(DURATION_TYPE_PERMANENT,eEffect2, GetLocation(oTarget1)));
            DelayCommand(fRandom, SetLocalInt(oTarget1, "nReady", 0));
        }
        if (GetIsObjectValid(oTarget2) == TRUE && GetLocalInt(oTarget2, "nReady") == 0)
        {
            SetLocalInt(oTarget2, "nReady", 1);
            fRandom = IntToFloat(Random(12) + 1);
            DelayCommand(fRandom, ApplyEffectAtLocation(DURATION_TYPE_PERMANENT,eEffect1, GetLocation(oTarget2)));
            DelayCommand(fRandom, ApplyEffectAtLocation(DURATION_TYPE_PERMANENT,eEffect2, GetLocation(oTarget2)));
            DelayCommand(fRandom, SetLocalInt(oTarget2, "nReady", 0));
        }
        if (GetIsObjectValid(oTarget3) == TRUE && GetLocalInt(oTarget3, "nReady") == 0)
        {
            SetLocalInt(oTarget3, "nReady", 1);
            fRandom = IntToFloat(Random(12) + 1);
            DelayCommand(fRandom, ApplyEffectAtLocation(DURATION_TYPE_PERMANENT,eEffect1, GetLocation(oTarget3)));
            DelayCommand(fRandom, ApplyEffectAtLocation(DURATION_TYPE_PERMANENT,eEffect2, GetLocation(oTarget3)));
            DelayCommand(fRandom, SetLocalInt(oTarget3, "nReady", 0));
        }
        if (GetIsObjectValid(oTarget4) == TRUE && GetLocalInt(oTarget4, "nReady") == 0)
        {
            SetLocalInt(oTarget4, "nReady", 1);
            fRandom = IntToFloat(Random(12) + 1);
            DelayCommand(fRandom, ApplyEffectAtLocation(DURATION_TYPE_PERMANENT,eEffect1, GetLocation(oTarget4)));
            DelayCommand(fRandom, ApplyEffectAtLocation(DURATION_TYPE_PERMANENT,eEffect2, GetLocation(oTarget4)));
            DelayCommand(fRandom, SetLocalInt(oTarget4, "nReady", 0));
        }
        if (GetIsObjectValid(oTarget5) == TRUE && GetLocalInt(oTarget5, "nReady") == 0)
        {
            SetLocalInt(oTarget5, "nReady", 1);
            fRandom = IntToFloat(Random(12) + 1);
            DelayCommand(fRandom, ApplyEffectAtLocation(DURATION_TYPE_PERMANENT,eEffect1, GetLocation(oTarget5)));
            DelayCommand(fRandom, ApplyEffectAtLocation(DURATION_TYPE_PERMANENT,eEffect2, GetLocation(oTarget5)));
            DelayCommand(fRandom, SetLocalInt(oTarget5, "nReady", 0));
        }

    }
}
