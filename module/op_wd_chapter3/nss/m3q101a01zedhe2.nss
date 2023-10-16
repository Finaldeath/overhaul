//::///////////////////////////////////////////////
//:: Heal Zed
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Has the player heal ZED
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: November 2001
//:://////////////////////////////////////////////

void main()
{
    talent tTalent = GetCreatureTalentBest(TALENT_CATEGORY_BENEFICIAL_HEALING_TOUCH, 20);
    if (GetIsTalentValid(tTalent) == TRUE)
    {
//    SpeakString("talent valid");
    object oZed = OBJECT_SELF;
        AssignCommand(GetPCSpeaker(), ActionUseTalentOnObject(tTalent, oZed));
    }
}
