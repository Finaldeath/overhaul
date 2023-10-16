//q1_onenter_save
//Do single player autosave for this area - the first time entered only

#include "nw_i0_plot"
void main()
{

    object oPC = GetEnteringObject();
    if (GetIsPlayerCharacter(oPC) == TRUE)
    {
        if (GetLocalInt(oPC, "X1_" + GetTag(OBJECT_SELF) + "AUTOSAVE") != 1)
        {
            SetLocalInt(oPC, "X1_" + GetTag(OBJECT_SELF) + "AUTOSAVE", 1);
            DoSinglePlayerAutoSave();

        }

    }
}
