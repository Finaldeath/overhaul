#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        float f = 90.0;

        SetCameraMode(oPC, CAMERA_MODE_TOP_DOWN);

        f += 90.0;

        SetCameraFacing(f, -1.0, -1.0, CAMERA_TRANSITION_TYPE_CRAWL);

        //This script never actually runs. Module Stage gets updated in Help_Hench
        SetLocalInt(GetModule(), "N_MODULE_STAGE", 1);

        SetTime(0, 0, 0, 0);

        object oGirl = GetNearestObjectByTag("CT_UNIQ_NT_DRGR", oPC);
        object oBoy = GetNearestObjectByTag("CT_UNIQ_NT_DRBY", oPC);

        object o;
        string s;
        string sGend;
        string sGend2;

        int i = 0;
        int j;
        float offset = 12.0;

        if (GetGender(oPC) == GENDER_MALE)
        {
            sGend = "his";
            sGend2 = "him";
        }

        else
        {
            sGend = "her";
            sGend2 = "her";
        }

        o = oPC;
        s = "[In the dark depths of your unconciousness, you find yourself in the midst of a strange dream...]";
        DelayCommand(offset * i++, SceneSpeak(o, s));

        o = oBoy;
        s = "Come to me, child of Okaris, come to me!  The time is at hand, there is no hope...  Only I may save you now...";
        DelayCommand(offset * i++ + 0.1, SceneSpeak(o, s));

        for (j = 0; j < 4; j++)
        {
            o = GetNearestObjectByTag("CT_UNIQ_NT_DRSP", oPC, j);

            DelayCommand(offset * i, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_PROTECTION_EVIL_MAJOR), o, offset));

            DelayCommand(offset * i + 0.2, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_FNF_STRIKE_HOLY), o, offset));

            DelayCommand(offset * i + 0.4, SceneSpeak(o, "[Shrrrrekkkk]"));

            DestroyObject(o, offset * i + 1.5);
        }

        o = oGirl;
        s = "No!  Now is not " + sGend + " time!  Begone!  You do not hold sway here yet!";
        DelayCommand(offset * i++, SceneSpeak(o, s));

        o = oBoy;
        s = "[Hsss...]  You cannot protect " + sGend2 + " forever!  I shall have " + sGend2 + ", and you shall not stand in my path!";
        DelayCommand(offset * i++ + 0.1, SceneSpeak(o, s));

        o = oGirl;
        s = "Wake up, " + GetName(oPC) + ", wake up!  Hear my call!  Wake up......";
        DelayCommand(offset * i++ + 0.2, SceneSpeak(o, s));

        AssignCommand(oPC, PlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 1.0, offset * i));

        DelayCommand(1.5, SetCommandable(FALSE, oPC));

        object oWP = GetWaypointByTag("WP_STAGE_1_JUMP");
        location lWP = GetLocation(oWP);

        DelayCommand(offset * i, SetCommandable(TRUE, oPC));

        DelayCommand(offset * i + 0.7, AssignCommand(oPC, JumpToLocation(lWP)));
    }
}
