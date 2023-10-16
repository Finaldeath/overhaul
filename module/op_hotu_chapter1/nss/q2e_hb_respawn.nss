//::///////////////////////////////////////////////
//:: q2b_hb_wander
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
Spawns wandering monsters.

Activate the Gargoyle trip if it has been tripped.

 ON Heartbeat, the area will check if the Module
    variable 'nHELLMOBCOUNT' is greater than 0 and less
    than the Maximum allowed (Try 20 to start).
    This variable is incremented when a creature
    from this level (q2e) is killed.  If it is greater
    than 0, a random
    monster will respawn at a random entry portal
    'q2e_hellspawn_(1-3)'
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Nov 12/02
//:://////////////////////////////////////////////
#include "x2_inc_plot"

void main()
{
    object oPC = GetFirstPC();
    int nCount = 0;
    while (oPC != OBJECT_INVALID)
    {
        if (GetTag(GetArea(oPC)) == "x2_reaper1")
        {
            nCount = nCount + 1;
        }
        oPC = GetNextPC();
    }
    if (nCount > 0)
    {
             //Respawner
            //MOB1
            if (GetLocalInt(GetModule(), "nQ2EMOBGoodCOUNT") > 0)
            {
                int nRandom = Random(6) + 1;
                object oPortal = GetObjectByTag("q2e_portalgood");

                object oNewCreature = CreateObject(OBJECT_TYPE_CREATURE, "q2e_good" + IntToString(nRandom), GetLocation(oPortal));

                effect eAppear = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_1);
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eAppear, GetLocation(oPortal));
                SetLocalInt(GetModule(), "nQ2EMOBGoodCOUNT", GetLocalInt(GetModule(), "nQ2EMOBGoodCOUNT") - 1);
            }
            //MOB2
            if (GetLocalInt(GetModule(), "nQ2EMOBEvilCOUNT") > 0)
            {
                int nRandom2 = Random(6) + 1;
                object oPortal2 = GetObjectByTag("q2e_portalevil");

                object oNewCreature2 = CreateObject(OBJECT_TYPE_CREATURE, "q2e_evil" + IntToString(nRandom2), GetLocation(oPortal2));

                effect eAppear2 = EffectVisualEffect(VFX_IMP_DISPEL);
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eAppear2, GetLocation(oPortal2));
                SetLocalInt(GetModule(), "nQ2EMOBEvilCOUNT", GetLocalInt(GetModule(), "nQ2EMOBEvilCOUNT") - 1);
            }

    }


}
