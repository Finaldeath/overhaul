#include "help_shadowguard"

void main()
{
    object o = GetEnteringObject();

    if (GetSubString(GetTag(o), 0, 10) == "CT_UNIQ_SG")
    {
        if (GetLocalInt(GetModule(), "N_MODULE_STAGE") == 1)
        {
            if (GetLocalInt(OBJECT_SELF, "N_DO_ONCE" + GetTag(o)) == 0)
            {
                int n = GetLocalInt(o, "N_CURR_MOVE_TO_WP");

                if (!GetIsInCombat())
                {
                    object oWP = GetNearestObjectByTag("WP_" + GetTag(o) + "_" + IntToString(n), o);

                    if (GetArea(o) == GetArea(oWP))
                    {
                        float f = GetFacing(oWP);
                        DelayCommand(1.0, AssignCommand(o, ClearAllActions()));
                        DelayCommand(1.5, AssignCommand(o, SetFacing(f)));
                        n++;
                        SetLocalInt(o, "N_CURR_MOVE_TO_WP", n);

                        string s = GetStringRight(GetTag(OBJECT_SELF), 1);
                        n = StringToInt(s);
                        SetLocalInt(o, "N_MOVE_TO_WP", n);

                        DoAITriggerSpeak(o);

                        SetLocalInt(OBJECT_SELF, "N_DO_ONCE" + GetTag(o), 1);
                    }
                }
            }
        }
    }
}
