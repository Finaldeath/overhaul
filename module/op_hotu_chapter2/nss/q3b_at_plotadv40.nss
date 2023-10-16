//::///////////////////////////////////////////////
//:: Advance Book of Vile Darkness plot to 40
//:: q3b_at_plotadv40
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Advance Book of Vile Darkness plot to 40
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 23/1/2003
//:://////////////////////////////////////////////


#include "q3_inc_plot"

void main()
{
    SetPlot("Q3_JOURNAL_BOOK_OF_VILE_DARKNESS", 40, GetPCSpeaker());
    SetLocalInt(GetPCSpeaker(), "Q3B_TALKED_MAYOR", 1);
}
