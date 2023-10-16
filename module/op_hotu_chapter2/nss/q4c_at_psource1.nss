// Getting the golem power source.

#include "x2_inc_globals"

void main()
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_DESTROY_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_DESTROY_ONCE", 1);

    SetLocalInt(GetModule(), "q4_power_source_taken", 1);
    CreateItemOnObject("q4_power_source", GetPCSpeaker());
    DestroyObject(OBJECT_SELF, 0.3);
    SetGlobalInt("x2_plot_golem2_in", 0); // no chance to get golems from aghaaz now.
    SetGlobalInt("x2_plot_psource", 1); // taken the power source - counts as plot complete for this area
}
