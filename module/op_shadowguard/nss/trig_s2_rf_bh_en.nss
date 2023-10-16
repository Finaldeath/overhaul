#include "help_general"
#include "nw_i0_generic"

void main()
{
    object o = GetEnteringObject();

    if (GetLocalInt(OBJECT_SELF, "N_DEACTIVE") == 0)
    {
        object oBH = GetNearestObjectByTag("CT_COMM_BH_STG2", o);

        if (GetArea(o) == GetArea(oBH))
        {
            if (GetObjectArmorString(o) == "Imperial")
            {
                SceneSpeak(oBH, "Imperials here on Azakhal?!  Quickly, we must rid ourselves of their foul presence!");

                AdjustReputation(o, oBH, -100);
                AdjustReputation(GetMaster(o), oBH, -100);

                ChangeToStandardFaction(oBH, STANDARD_FACTION_HOSTILE);

                AssignCommand(oBH, DetermineCombatRound());

                oBH = GetNearestObjectByTag("CT_COMM_BH_STG2", oBH);

                if (GetArea(o) == GetArea(oBH))
                {
                    AdjustReputation(o, oBH, -100);

                    AssignCommand(oBH, DetermineCombatRound());
                }

                SetLocalInt(OBJECT_SELF, "N_DEACTIVE", 1);
            }

            else
                SceneSpeak(oBH, "[The Bloodhawk looks towards you in disdain.]  Why have you dared intrude into my room?!  I suggest you either speak your business or leave quickly, fool!");
        }
    }
}
