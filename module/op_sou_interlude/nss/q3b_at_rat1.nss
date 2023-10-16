//::///////////////////////////////////////////////
//:: FileName q3b_at_rat1
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 5/13/2003 5:27:46 PM
//:://////////////////////////////////////////////
void main()
{
    SetCommandable(TRUE, OBJECT_SELF);
    // Give the speaker the items
    object oItemToGive = GetItemPossessedBy(OBJECT_SELF, "NW_IT_GEM005");
    ActionGiveItem(oItemToGive, GetPCSpeaker());
    int nAlign = GetAlignmentGoodEvil(GetLastKiller());
    if(nAlign == ALIGNMENT_GOOD || nAlign == ALIGNMENT_NEUTRAL)
    {
        object oKiller = GetLastKiller();
        AdjustAlignment(oKiller, ALIGNMENT_EVIL, 5);
    }

}
