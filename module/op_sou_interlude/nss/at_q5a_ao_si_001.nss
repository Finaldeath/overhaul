#include "x1_inc_plot"

void main()
{
  object oClicker = GetClickingObject();
  object oTarget = GetTransitionTarget(OBJECT_SELF);

  if(GetLocalInt(GetModule(), "Q5_TALKED_TO_GARRICK") == 0)
  {
    AssignCommand(oClicker, SpeakStringByStrRef(40502));
    SetPlot("Q5_JOURNAL_WAY", 1, GetPCSpeaker());
    return;
  }
  AssignCommand(oClicker,JumpToObject(oTarget));
}
