int StartingConditional()
{
  //Hector is in sight
  object oHector = GetLocalObject(GetModule(),"oHector104a");
  return GetObjectSeen(oHector);
}
