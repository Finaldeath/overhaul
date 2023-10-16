#include "help_general"
#include "help_hench"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetLocalInt(OBJECT_SELF, "N_DO_ONCE") == 0)
        {
            string sVarh = "CT_UNIQ_SH_VARH";
            string sKara = "CT_UNIQ_SG_KARA";

            object oKara = GetNearestObjectByTag(sKara, oPC);
            object oVarh = GetNearestObjectByTag(sVarh, oPC);
            object oDoor = GetNearestObjectByTag("DOOR_CHANCELLOR", oPC);

            if (GetDistanceBetween(oKara, oDoor) < 10.0 && GetDistanceBetween(oVarh, oDoor) < 10.0)
            {
                object oWP = GetNearestObjectByTag("MP_VARH_QUAR", oPC);

                SceneSpeak(oKara, "[Kara gives you a slight nod while Chancellor Varhun is not looking.]  Come my love... let us retire to your quarters...");

                AssignCommand(oKara, JumpToObject(oWP));
                AssignCommand(oVarh, JumpToObject(oWP));

                float f = GetFacing(oKara);

                DelayCommand(1.0, AssignCommand(oKara, SetFacing(f - 180.0)));

                SetLocalInt(OBJECT_SELF, "N_DO_ONCE", 1);
            }
        }

        if (GetJournalQuestState("JT_PREL_KARA", oPC) > 7)
        {
            object oKara = GetNearestObjectByTag("CT_UNIQ_SG_KARA", oPC);

            if (GetArea(oKara) == GetArea(oPC))
                DestroyObject(oKara);
        }
    }
}
