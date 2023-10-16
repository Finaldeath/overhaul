//::///////////////////////////////////////////////
//:: Name q2a_hb_imloth
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Heart beat for commander imloth
    Check for enemies near the seer and attack them
    during battle 2 of the siege
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 24/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(GetModule(), "X2_Q2ABattle2Started") != 1)
        return;
    if (IsInConversation(OBJECT_SELF) == TRUE)
        return;
    if (GetIsInCombat() == TRUE)
        return;

    //if during one of the waves, but not in between
    int nAttack = FALSE;
    if (GetLocalInt(GetModule(), "X2_Q2Battle2Wave4Spawned") == 1 && GetLocalInt(GetModule(), "X2_Q2Battle4Wave2Over") != 1)
        nAttack = TRUE;
    else if (GetLocalInt(GetModule(), "X2_Q2Battle2Wave3Spawned") == 1 && GetLocalInt(GetModule(), "X2_Q2Battle3Wave2Over") != 1)
        nAttack = TRUE;
    else if (GetLocalInt(GetModule(), "X2_Q2Battle2Wave2Spawned") == 1 && GetLocalInt(GetModule(), "X2_Q2Battle2Wave2Over") != 1)
        nAttack = TRUE;

    if (nAttack == TRUE)
    {
        object oSeer = GetObjectByTag("q2aseer");
        object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, oSeer);
        if (GetIsObjectValid(oEnemy) == TRUE)
        {
            float fDistance = GetDistanceBetween(oSeer, oEnemy);
            if (fDistance < 15.0 && fDistance > 0.0)
                ActionAttack(oEnemy);
        }
    }
}
