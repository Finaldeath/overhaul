//::///////////////////////////////////////////////
//:: FileName q4a_donan_rdy
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 1/8/2003 4:39:30 PM
//:://////////////////////////////////////////////
void main()
{
    // Give the speaker the items
    CreateItemOnObject("q4a_water_mold", GetPCSpeaker(), 1);

    // Set the variables
    SetLocalInt(GetPCSpeaker(), "donan_ready", 2);
    SetLocalInt(OBJECT_SELF, "gave_mold", 1);

}
