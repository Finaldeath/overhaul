//::///////////////////////////////////////////////
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Check to see if the PC has SPELL_TIME_STOP
  memorized...
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: June 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    if(GetLocalInt(GetArea(OBJECT_SELF), "STORED_SPELL" + IntToString(SPELL_TIME_STOP)) == 1)
        return FALSE;
    if (GetHasSpell(
       SPELL_TIME_STOP
      , GetPCSpeaker()) > 0)

        {
            return TRUE;
        }
    object oScroll = GetItemPossessedBy(GetPCSpeaker(), "NW_IT_SPARSCR911");
    if(oScroll != OBJECT_INVALID)
    {
        return TRUE;
    }
    return FALSE;
}
