import json
import os

root_path = 'wizard/qwen2'

data_list = {}
for root, dirs, files in os.walk(root_path):
    for dir in dirs:
        dir_path = os.path.join(root, dir)
        for root2, dirs2, files2 in os.walk(dir_path):
            for file in files2:
                file_path = os.path.join(root2, file)
                with open(file_path, 'r') as f:
                    data = json.load(f)
                    results = data['results']   
                    name = root2.split('__')[-1]
                    if name not in data_list.keys():
                        data_list[name] = {}
                    if 'hellaswag' in results.keys():
                        data_list[name]['hellaswag'] = results['hellaswag']["acc,none"]
                        # print(root2.split('__')[-1])
                        # print(results['hellaswag']["acc,none"])
                        # print(results['hellaswag']["acc_norm,none"])
                    if 'truthfulqa_mc2' in results.keys():
                        data_list[name]['truthfulqa_mc2'] = results['truthfulqa_mc2']["acc,none"]
                    if 'arc_challenge' in results.keys():
                        data_list[name]['arc_challenge'] = results['arc_challenge']["acc,none"]

for item in data_list.keys():
    print(item)
    # if 'ifd' in item:
    #     print(round(data_list[item]['hellaswag']*100,2))

    #     print(round(data_list[item]['arc_challenge']*100,2))
    # else:
    print(round(data_list[item]['hellaswag']*100,2))
    print(round(data_list[item]['truthfulqa_mc2']*100,2))
    print(round(data_list[item]['arc_challenge']*100,2))

