//::///////////////////////////////////////////////
//:: FileName q2c2_chk_grchain
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: 11/6/2002 1:52:11 PM
//:://////////////////////////////////////////////


int StartingConditional()
{

    // Make sure the PC speaker has this chain in their inventory
    if(GetItemPossessedBy(GetPCSpeaker(), "q2c2_chain_yel") == OBJECT_INVALID)
        return FALSE;

    return TRUE;
}
