#include "x1_inc_plot"

void main()
{
  object oClicker = GetClickingObject();
  object oTarget = GetTransitionTarget(OBJECT_SELF);

  if(GetPlot("Q2_JOURNAL_ROD") >= 80)
  {
    string sTag = GetTag(oTarget);
    sTag = sTag + "2";
    oTarget = GetObjectByTag(sTag);
  }
  AssignCommand(oClicker,JumpToObject(oTarget));
}
