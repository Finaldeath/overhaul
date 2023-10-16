// Beholders talk to playe if spec is with them

#include "nw_i0_generic"

void Talk(object oPC)
{
    BeginConversation("", oPC);
}

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    object oBeholder = GetNearestObjectByTag("q5_beholder_talker");
    object oSpec = GetObjectByTag("q5_spec");
    if(GetMaster(oSpec) != oPC)
    {
        // Beholders become hostile
        AdjustReputation(oPC, oBeholder, -100);
        AssignCommand(oBeholder, DetermineCombatRound(oPC));
    }
    else
    {
        // Beholders talk
        AssignCommand(oBeholder, Talk(oPC));
    }

}
