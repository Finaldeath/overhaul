//::///////////////////////////////////////////////
//::
//:: Dialogue
//::
//:: M1Q4Vengaul_8.nss
//::
//:: Copyright (c) 2001 Bioware Corp.
//::
//::
//:://////////////////////////////////////////////
//::
//::
//:: If someone from Vengaul's faction is attacked
//:: he drops the cockatrice and runs away.
//::
//::
//:://////////////////////////////////////////////
//::
//:: Created By: John
//:: Created On: September 14, 2001
//::
//:://////////////////////////////////////////////

void main()
{
    object oShouter = GetLastSpeaker();
    int nMatch = GetListenPatternNumber();
    switch (nMatch)
    {
        case -1:
            BeginConversation();
        break;

        case 0: case 1:
            if (GetIsObjectValid(oShouter) &&
                GetIsFriend(oShouter) &&
                !GetIsPC(oShouter))
            {
                ActionPutDownItem(GetItemPossessedBy(OBJECT_SELF,"M1Q04ICOCKATRICE"));
                ActionMoveToObject(GetWaypointByTag("WP_M1Q4D_M1Q4A"),TRUE);
                ActionDoCommand(DestroyObject(OBJECT_SELF));
            }
            break;
        }
}
