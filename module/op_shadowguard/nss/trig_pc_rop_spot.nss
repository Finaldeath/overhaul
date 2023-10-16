#include "help_skills"
#include "help_general"

void main()
{
    object o = GetEnteringObject();

    object oWPUp = GetNearestObjectByTag("WP_PC_ROPE_U");

    object oWPLw = GetNearestObjectByTag("WP_PC_ROPE_L");

    location lWP;

    object oBoulder = GetLocalObject(OBJECT_SELF, "O_BOULDER");

    string sName = GetName(oWPUp);

    int nDifficulty = StringToInt(GetStringRight(sName, 2));

    if (GetLocalInt(GetModule(), "N_TEST") == 1)
        SendMessageToPC(GetFirstPC(), "[Parsing out the Difficulty from the Waypoint Name : " + sName + " ; After parsing : " + IntToString(nDifficulty) + "]");

    if (!(GetIsInCombat(o)))
    {
        // if spots the rope waypoint
        if (SkillCheck(o, SKILL_SPOT, nDifficulty))
        {
            if (GetLocalInt(GetModule(), "N_TEST") == 1)
            {
                SendMessageToPC(GetFirstPC(), "[Spot check made for : " + GetName(o) + " ; Difficulty set at : " + IntToString(nDifficulty) + "]");
            }

            // if spotter is PC or Henchman
            if (GetIsPC(o) || GetIsPC(GetMaster(o)))
            {
                // if first time for PC or Henchman in this trigger, have them speak about it
                if (GetFirstTimeIn())
                {
                    AssignCommand(o, ClearAllActions());

                    AssignCommand(o, SetFacing(GetFacing(oWPUp)));

                    SceneSpeak(o, "[Spot Success]  Interesting...  That boulder on the hill appears just the right size to possibly lasso a rope around it, allowing navigation up and down this slope...");

                    AssignCommand(o, PlayAnimation(ANIMATION_LOOPING_LOOK_FAR, 1.0, 6.0));
                }

                // if boulder has not yet been created, create it
                if (oBoulder == OBJECT_INVALID)
                {
                    lWP = GetLocation(oWPUp);

                    oBoulder = CreateObject(OBJECT_TYPE_PLACEABLE, "PLAC_PC_RPRK_U", lWP);

                    SetLocalObject(oBoulder, "O_COLLABORATOR", oWPLw);

                    SetLocalObject(OBJECT_SELF, "O_BOULDER", oBoulder);
                }

                // if Associate, set object o to be Master
                if (!(GetIsPC(o)))
                    o = GetMaster(o);

                // Always reset the PC's Current Rope Object to this object
                SetLocalObject(o, "O_CURR_ROPE_OBJECT", oBoulder);
            }
        }
    }
}
