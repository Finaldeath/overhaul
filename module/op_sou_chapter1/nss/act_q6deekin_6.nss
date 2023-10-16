//::///////////////////////////////////////////////
//:: Name act_q6deekin_6
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Deekin runs off towards blumberg and will reappear
    in his shop there...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 6/03
//:://////////////////////////////////////////////

void main()
{
    //Activate wolf encounter
    object oEncounter = GetObjectByTag("q1rural_hfwolves");
    SetEncounterActive(TRUE, oEncounter);

    ActionMoveToObject(oEncounter, TRUE);
    DestroyObject(OBJECT_SELF, 5.0);
    SetLocalInt(GetModule(), "X1_DeekinSpawnAtShop", 1);
}
