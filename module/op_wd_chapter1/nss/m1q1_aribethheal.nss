//::///////////////////////////////////////////////
//:: Conversation
//:: M1Q1_aribethheal
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Aribeth casts Heal on the PC and henchman
    Pauses dialogue to do it, then resumes
*/
//:://////////////////////////////////////////////
//:: Created By: Lukas Kristjanson
//:: Created On: April 05, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oHenchman =GetHenchman(oPC);

    ActionPauseConversation();
    ActionCastSpellAtObject(SPELL_GREATER_RESTORATION,oPC,METAMAGIC_ANY,TRUE);
    if(GetIsObjectValid(oHenchman))
    {
        ActionCastSpellAtObject(SPELL_GREATER_RESTORATION,oHenchman,METAMAGIC_ANY,TRUE,0,PROJECTILE_PATH_TYPE_DEFAULT,TRUE);
        object oPotion = GetItemPossessedBy(oHenchman,"NW_IT_MPOTION003"); //critical
        if(GetIsObjectValid(oPotion) == FALSE)
        {
            oPotion = GetItemPossessedBy(oHenchman,"NW_IT_MPOTION002");  //serious
            if(GetIsObjectValid(oPotion) == FALSE)
            {
                oPotion = GetItemPossessedBy(oHenchman,"NW_IT_MPOTION020");  //moderate
            }
        }
        if(GetIsObjectValid(oPotion) == FALSE)
        {
            CreateItemOnObject("nw_it_mpotion020",oHenchman,3);
        }
    }
    ActionResumeConversation();
}

