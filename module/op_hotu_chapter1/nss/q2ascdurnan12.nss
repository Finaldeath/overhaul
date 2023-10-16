int StartingConditional()
{
   if (GetLocalInt(GetPCSpeaker(),"q2adurnantalk") > 0)
        return FALSE;

   return TRUE;
}
