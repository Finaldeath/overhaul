// first hive trigger - player hears a voice in his head

#include "nw_i0_plot"

void HaltHive(object oPC, object oQueen)
{
    int n = 1;
    // making sure all nearby formian cease battle
    object oFormian = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_OUTSIDER, oPC, n);
    while(oFormian != OBJECT_INVALID)
    {
        n++;
        //float fDistance = GetDistanceBetween(oPC, oFormian);
        AssignCommand(oFormian, SurrenderToEnemies());
        AssignCommand(oFormian, ClearAllActions());
        if(GetIsInCombat(oFormian))
            AssignCommand(oFormian, ActionMoveAwayFromObject(oPC, TRUE));
        oFormian = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_OUTSIDER, oPC, n);
    }

    AdjustReputation(oPC, oQueen, 100);
    AdjustReputation(oQueen, oPC, 100);
}

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPlayerCharacter(oPC))
        return;
    object oQueen = GetNearestObjectByTag("X0_FORM_QUEEN");
    if(oQueen == OBJECT_INVALID)
        return;
    if(!GetIsEnemy(oPC, oQueen))
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    AssignCommand(oPC, ClearAllActions());
    AssignCommand(oPC, SpeakOneLinerConversation("q3c_hivequeen3", oPC));


    oPC = GetFirstPC();
    while(oPC != OBJECT_INVALID)
    {
        AssignCommand(oPC, PlaySound("sco_swar3blue"));
        DelayCommand(3.0, AssignCommand(oPC, PlaySound("c_x0frmwar_bat1")));
        HaltHive(oPC, oQueen);
        oPC = GetNextPC();
    }


}
