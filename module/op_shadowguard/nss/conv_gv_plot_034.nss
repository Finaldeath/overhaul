#include "help_general"

//::///////////////////////////////////////////////
//:: FileName conv_gv_plot_034
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 7/2/2003 4:22:11 AM
//:://////////////////////////////////////////////
void main()
{
    // Give the speaker the items
    CreateItemOnObject("it_plot_034", GetPCSpeaker(), 1);

    SceneSpeak(GetPCSpeaker(), "[You gingerly take the young girl into your arms...]");

    DestroyObject(OBJECT_SELF, 1.0);
}
