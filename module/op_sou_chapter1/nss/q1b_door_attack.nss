#include "nw_i0_plot"
void main()
{
    object oPC = GetLastHostileActor();
    if (GetMaster(oPC) != OBJECT_INVALID)
        oPC = GetMaster(oPC);
    if (GetIsPlayerCharacter(oPC) == TRUE && GetLocalInt(oPC, "X1_nAttackedDoor") < 2)
    {
        object oGuard1 = GetObjectByTag("q1bguard1");
        object oGuard2 = GetObjectByTag("q1bguard2");
        if (GetObjectSeen(oPC, oGuard1) == TRUE || GetObjectSeen(oPC, oGuard2) == TRUE)
        {
            AssignCommand(oGuard1, ActionMoveToObject(oPC, TRUE));
            AssignCommand(oGuard1, SpeakStringByStrRef(40361, TALKVOLUME_SHOUT));
            AssignCommand(oGuard2, ActionMoveToObject(oPC, TRUE));
            AssignCommand(oGuard2, SpeakStringByStrRef(40361, TALKVOLUME_SHOUT));
        }
    }
    else if (GetIsPlayerCharacter(oPC) == TRUE && GetLocalInt(oPC, "X1_nAttackedDoor") >= 2)
    {
        object oGuard1 = GetObjectByTag("q1bguard1");
        object oGuard2 = GetObjectByTag("q1bguard2");
        if (GetObjectSeen(oPC, oGuard1) == TRUE || GetObjectSeen(oPC, oGuard2) == TRUE)
        {
            SetIsTemporaryEnemy(oPC, oGuard1);
            SetIsTemporaryEnemy(oPC, oGuard2);
            AssignCommand(oGuard1, ActionAttack(oPC));
            AssignCommand(oGuard2, ActionAttack(oPC));
        }
    }

}
