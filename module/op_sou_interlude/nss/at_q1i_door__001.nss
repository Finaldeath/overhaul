#include "x1_inc_plot"

void main()
{
  object oClicker = GetClickingObject();
  object oTarget = GetLocalObject(OBJECT_SELF, "DEST");


  object oZidan = GetNearestObjectByTag("Q1_ZIDAN");
  if(GetLocalObject(oZidan, "Q1_FOLLOW") == oClicker)
      AssignCommand(oZidan, JumpToObject(oTarget));

  AssignCommand(oClicker,JumpToObject(oTarget));
}
