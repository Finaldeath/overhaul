//if the pc damages the gate - then everyone switches sides on him..
//q2a_dam_gate2
#include "nw_i0_generic"
#include "x0_i0_henchman"
#include "nw_i0_plot"
float GetRandomDelay2(int nMaxSeconds, float fFraction = 1.0);

void main()
{
    //Do nothing before the siege
    if (GetLocalInt(GetModule(), "X2_Bat1PCNoTransition") == 0)
        return;

    // Do nothing before the enemy comes in (after the cutscene)
    if (GetLocalInt(GetModule(), "X2_Bat1EnemyArrived") == 0)
        return;

    if (GetLocalInt(OBJECT_SELF, "nPCDamaged") == 1)
        return;
    //Only can damage the gate when its not plot.
    object oPC = GetLastDamager();
    if (GetIsPC(oPC) == FALSE)
        return;

    //take care of the henchmen
    object oNathyrra = GetObjectByTag("x2_hen_nathyra");
    object oValen = GetObjectByTag("x2_hen_valen");

    object oMaster1 = GetMaster(oNathyrra);
    if (GetIsObjectValid(oMaster1) == TRUE)
    {
        FireHenchman(oMaster1, oNathyrra);
        ChangeToStandardFaction(oNathyrra, STANDARD_FACTION_COMMONER);
    }
    object oMaster2 = GetMaster(oValen);
    if (GetIsObjectValid(oMaster2) == TRUE)
    {
        FireHenchman(oMaster2, oValen);
        ChangeToStandardFaction(oValen, STANDARD_FACTION_COMMONER);
    }
    AssignCommand(oNathyrra, SetIsDestroyable(TRUE));
    AssignCommand(oValen, SetIsDestroyable(TRUE));

    SetLocalInt(OBJECT_SELF, "nPCDamaged", 1);

    //Make sure other cutscenes don't happen
    SetLocalInt(oPC, "X2_EvilBetrayerType", 1);
    SetLocalInt(GetModule(), "X2_PCPhase1Betray", 1);

    object oCreature = GetFirstObjectInArea();
    while(GetIsObjectValid(oCreature) == TRUE)
    {
        if (GetObjectType(oCreature) == OBJECT_TYPE_CREATURE)
        {
            if (GetIsPC(oCreature) == FALSE)
            {
                if (GetTag(oCreature) != "x2_hen_deekin")
                {
                    AssignCommand(oCreature, ClearAllActions(TRUE));
                    if (GetReputation(oCreature, oPC) > 10)
                    {
                        SetIsTemporaryEnemy(oPC, oCreature);
                        if (Random(5) == 4)
                        {
                            DelayCommand(GetRandomDelay2(5), AssignCommand(oCreature, SpeakStringByStrRef(85766)));
                        }
                    }
                    else
                        SetIsTemporaryFriend(oPC, oCreature);
                    DelayCommand(1.0, AssignCommand(oCreature, DetermineCombatRound()));
                }
            }
        }

        oCreature = GetNextObjectInArea();
    }


}
//Specify a divisor if you want a fraction of a second delay
//Max Seconds divided by nDivisor
float GetRandomDelay2(int nMaxSeconds, float fFraction = 1.0)
{
    float fRandom = IntToFloat(Random(nMaxSeconds + 1)) * fFraction;

    return fRandom;
}
