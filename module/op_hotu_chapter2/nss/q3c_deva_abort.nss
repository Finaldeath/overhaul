
#include "x2_inc_globals"

void main()
{
    if(GetLocalInt(OBJECT_SELF, "LEAVE_DIALOG") == 1) // aborting the "leave" dialog
    {
        effect eVis = EffectVisualEffect(472);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF);
        object oWP = GetWaypointByTag("x2_wp_devahelp");
        SetGlobalInt("x2_plot_deva_help", 1);
        if(oWP == OBJECT_INVALID)
            DelayCommand(1.0, DestroyObject(OBJECT_SELF));
        else
        {
            RemoveHenchman(GetPCSpeaker(), OBJECT_SELF);
            DelayCommand(1.0, JumpToObject(oWP));
            SetLocalInt(OBJECT_SELF, "CAMP_DIALOG", 1);
        }
    }
}
