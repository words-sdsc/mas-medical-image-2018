# heartsmart
# make sure libs are downgraded and other image related modules are installed
#run /masvol/update.sh
cd /masvol
./update.sh

# for bringing up jupyter notebook from /masvol/heartsmart
cp /masvol/jupyter_notebook_config.py ~/.jupyter/

# when running unet_train.py from /masvol/heartsmart/unet_model, it can see helpers_dicom in /masvol/heartsmart/Final/preprocessing path
cp /masvol/heartsmart.pth to /usr/local/lib/python3.5/dist-packages/

# cd to /masvol/heartsmart/Final/unet_model
# type python3 to get into python env
# import unet_train
# help(unet_train)
# this will show you the comments
