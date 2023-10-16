//Check so see if henchman has died once.
int StartingConditional()
        {
            // Inspect local variables
            if (GetLocalInt(OBJECT_SELF, "X2_L_IJUSTDIED"))
                return TRUE;
            return FALSE;
        }


