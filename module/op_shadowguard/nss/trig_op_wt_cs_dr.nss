#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        object oDoor = GetNearestObject(OBJECT_TYPE_DOOR);

        SetLocked(oDoor, FALSE);

        AssignCommand(oDoor, ActionOpenDoor(oDoor));

        object oHench = GetHenchman(oPC);

        string sName;

        if (oHench != OBJECT_INVALID)
        {
            sName = GetName(oHench);

            object oGuard;

            int i = 1;

            oGuard = GetNearestObjectByTag("CT_COMM_SH_GUAR", OBJECT_SELF, i);

            while (oGuard != OBJECT_INVALID && GetDistanceBetween(oGuard, oDoor) <= 5.0)
            {
                SceneSpeak(oGuard, "Welcome back to Zhantara, " + sName + "...");

                i++;

                oGuard = GetNearestObjectByTag("CT_COMM_SH_GUAR", OBJECT_SELF, i);
            }
        }

        DelayCommand(10.0, AssignCommand(oDoor, ActionCloseDoor(oDoor)));

        DelayCommand(10.0, SetLocked(oDoor, TRUE));
    }
}
