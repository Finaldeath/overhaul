#include "x1_inc_plot"

void main()
{
  object oClicker = GetClickingObject();
  object oTarget = GetTransitionTarget(OBJECT_SELF);

  if(GetPlot("Q2_JOURNAL_ROD") >= 10)
  {
      oTarget = GetWaypointByTag("Q2A_WP_TOMB_EXIT");
  }
  AssignCommand(oClicker,JumpToObject(oTarget));
}
