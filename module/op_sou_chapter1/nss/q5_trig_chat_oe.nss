#include "nw_i0_plot"
#include "nw_i0_generic"
void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPlayerCharacter(oPC))
        return;

    if (GetStealthMode(oPC) == STEALTH_MODE_ACTIVATED)
        return;

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
       return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    object oKobold1 = GetNearestObjectByTag("Q5_KOBOLD_WOLF1");
    object oKobold2 = GetNearestObjectByTag("Q5_KOBOLD_WOLF2");

    if(GetIsEnemy(oPC, oKobold1) || GetIsEnemy(oPC, oKobold2) ||
            GetIsInCombat(oKobold1) || GetIsInCombat(oKobold2))
        return;

    AssignCommand(oKobold1, ActionStartConversation(oKobold2, "q5_kobold_chat"));
    DelayCommand(6.0, ChangeToStandardFaction(oKobold1, STANDARD_FACTION_HOSTILE));
    DelayCommand(6.0, ChangeToStandardFaction(oKobold2, STANDARD_FACTION_HOSTILE));
    DelayCommand(6.0, AssignCommand(oKobold1, DetermineCombatRound()));
    DelayCommand(6.0, AssignCommand(oKobold2, DetermineCombatRound()));
}
