// updates locals that determine if aribeth has been spoken to
#include "NW_I0_Plot"
void main()
{
    if(GetLocalInt(GetModule(),"NW_G_M1Q6A01RitualComplete"))
    {
        SetLocalInt(GetModule(),"NW_G_M1Q6A01AribethPostRitual",TRUE);
    }
    else
    {
        SetLocalInt(GetModule(),"NW_G_M1Q6A01AribethPreRitual",TRUE);
    }
    PlayOldTheme();
}
