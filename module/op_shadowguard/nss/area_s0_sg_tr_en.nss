#include "help_general"
#include "help_hench"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetFirstTimeIn())
        {
            SetPlotFlag(oPC, FALSE);

            StopFade(oPC);

            string sConv = "sc_st_0_sg_train";

            SetCommandable(FALSE, oPC);

            FloatingTextStringOnCreature("Shadowguard I", oPC);

            DelayCommand(2.0, FloatingTextStringOnCreature("Rites of Passage", oPC));

            DelayCommand(3.7, SetCommandable(TRUE, oPC));

//            DelayCommand(4.0, BeginCutscene(oPC, sConv));
        }
    }
}
