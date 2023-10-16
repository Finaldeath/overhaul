//::///////////////////////////////////////////////
//:: FileName q4a_ear1
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 1/15/2003 1:07:49 PM
//:://////////////////////////////////////////////
void main()
{

    // Remove items from the player's inventory
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "gargoyle_ear");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
    // Set the variables
    SetLocalInt(OBJECT_SELF, "q4a_gong_ear", 1);

}
