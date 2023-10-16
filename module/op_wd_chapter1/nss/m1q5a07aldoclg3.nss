int StartingConditional()
{
  // hector is not in sight
  object oHector = GetLocalObject(GetModule(),"oHector104a");
  return GetObjectSeen(oHector) == FALSE;
}
