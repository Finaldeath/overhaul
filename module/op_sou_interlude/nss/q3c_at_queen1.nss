//::///////////////////////////////////////////////
//:: FileName q3c_at_queen1
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 4/1/2003 8:48:07 PM
//:://////////////////////////////////////////////
void main()
{
    // Give the speaker the items
    CreateItemOnObject("q3_formcrystal", GetPCSpeaker(), 1);
    SetLocalInt(GetModule(), "Q3_FORMIAN_CRYSTAL_GIVEN", 1);
    //Set that agreement is reached.
    SetLocalInt(OBJECT_SELF,"X1_HIVEQUEENSPOKE",10);
}
